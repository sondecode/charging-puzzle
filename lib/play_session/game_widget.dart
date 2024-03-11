// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/common/function.dart';
import 'package:ev_driver/sprites/car_sprite.dart';
import 'package:ev_driver/sprites/puzzle_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
///

class GameWidget extends StatefulWidget {
  late bool firstTouch = false;
  late int carDirect = 0;
  late String letterCar = "C";
  late String spriteImage = 'assets/images/sprites/C_sprite.png';
  late int startX = 0;
  late int startY = 0;
  GameWidget({super.key});
  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late List<List<String>> stateMap;
  late bool isWin = false;

  //Car Cood
  late double _endX = 0.0;
  late double _endY = 0.0;
  late bool isVisible = true;
  final stepDuration = 400;

  @override
  void initState() {
    super.initState();
    final level = context.read<GameLevel>();
    widget.startX = level.startX;
    widget.startY = level.startY;
    widget.letterCar = level.sprite;
    widget.spriteImage = 'assets/images/sprites/${widget.letterCar}_sprite.png';
    stateMap = List.generate(
      level.initMap.length,
      (i) => List<String>.from(level.initMap[i]),
    );
    switch (level.flow.first) {
      case -3:

        //up
        widget.carDirect = 270;
        break;
      case -1:

        //down
        widget.carDirect = 90;
        break;
      case -2:

        //right
        widget.carDirect = 0;
        break;
      case -5:

        //left
        widget.carDirect = 180;
        break;
      default:
        break;
    }
  }

  Future<void> drivingCar(
      List<int> flow, int currentIndex, double width) async {
    // Base case: if all steps are completed, return
    if (currentIndex >= flow.length) {
      setState(() {
        isVisible = true;
      });
      return;
    }

    final step = flow[currentIndex];
    setState(() {
      isVisible = false;

      switch (step) {
        case 3:
          //up
          _endY -= width;
          widget.carDirect = 270;
          break;
        case 1:
          //down
          _endY += width;
          widget.carDirect = 90;
          break;
        case 2:
          //left
          _endX -= width;
          widget.carDirect = 180;
          break;
        case 0:
          //right
          _endX += width;
          widget.carDirect = 0;
          break;
        default:
          _endY = width * widget.startY;
          _endX = width * widget.startX;
          break;
      }
    });

    // Calculate the duration for this step// Adjust duration as needed

    // Wait for the duration of this step
    Future.delayed(Duration(milliseconds: stepDuration), () async {
      // Move to the next step
      await drivingCar(flow, currentIndex + 1, width);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.95 + 15;
    final double _height = MediaQuery.of(context).size.height * 0.85 - 30;

    final bool widthLarger = _width >= _height;
    final bool squareMap = stateMap.first.length == stateMap.length;

    final level = context.watch<GameLevel>();

    // stateMap = level.initMap;
    final levelState = context.watch<LevelState>();

    final selectedMapwith = mapLongerScreen(
        stateMap.length / stateMap.first.length, _height / _width);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.green,
      ),
      height: widthLarger
          ? _height
          : squareMap
              ? _width + 60
              : _height,
      width: _height / stateMap.length * stateMap.first.length,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(children: [
          GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: stateMap.first.length,
              ),
              itemCount: stateMap.length * stateMap.first.length,
              // Adjust based on your grid size
              itemBuilder: (context, index) {
                int i, j = 0;
                i = (index / stateMap.first.length).floor();
                j = (index % stateMap.first.length);

                final data = stateMap[i][j].split('_');

                final _isStart = isStart(data.first);

                return SizedBox(
                  child: PuzzleTile(
                    disable: isWin,
                    isStart: _isStart,
                    width: _height / stateMap.length,
                    startBg: _isStart && isWin,
                    hide: level.winMap[i][j] == "0" && isWin,
                    letter: _isStart ? widget.letterCar : data.first,
                    isBg: isBackground(data.first),
                    angle: int.parse(data.last),
                    onTap: () async {
                      setState(() {
                        context.read<AudioController>().playSfx(SfxType.rotate);

                        if (data.first == 'I') {
                          if (data.last == '1') {
                            stateMap[i][j] = "I_0";
                          } else {
                            stateMap[i][j] = "I_1";
                          }
                        } else {
                          stateMap[i][j] =
                              '${data.first}_${(int.parse(data.last) + 1) % 4}';
                        }
                        // Update the stateMap
                      });
                      if (checkMap(stateMap, level.winMap)) {
                        isWin = true;
                        widget.firstTouch = false;

                        context
                            .read<AudioController>()
                            .playSfx(SfxType.carStart);

                        await drivingCar(
                          level.flow,
                          0,
                          widthLarger
                              ? _height / stateMap.length
                              : squareMap
                                  ? _width / stateMap.length
                                  : !selectedMapwith
                                      ? _width / stateMap.first.length
                                      : _height / stateMap.length,
                        );
                        Future.delayed(
                            Duration(
                                milliseconds: stepDuration * level.flow.length),
                            () async {
                          // Move to the next step
                          levelState.evaluate();
                        });
                      }
                    },
                  ),
                );
              }),
          isWin & !isVisible
              ? CarWidget(
                  degree: widget.carDirect,
                  width: widthLarger
                      ? _height / stateMap.length
                      : squareMap
                          ? _width / stateMap.length
                          : !selectedMapwith
                              ? _width / stateMap.first.length
                              : _height / stateMap.length,
                  endX: _endX,
                  endY: _endY,
                  duration: 500,
                  image: Image.asset(widget.spriteImage))
              : Container(),
          level.number == 1 && !widget.firstTouch
              ? Positioned(
                  top: _height / stateMap.length,
                  right: _width / stateMap.length,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.firstTouch = true;
                      });
                    },
                    child: Icon(
                      Icons.touch_app,
                      size: 100,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ))
              : Container()
        ]),
      ),
    );
  }
}
