// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/common/function.dart';
import 'package:ev_driver/game_internals/transport_state.dart';
import 'package:ev_driver/player_progress/player_progress.dart';
import 'package:ev_driver/shopping/items.dart';
import 'package:ev_driver/sprites/car_sprite.dart';
import 'package:ev_driver/sprites/puzzle_tile.dart';
import 'package:ev_driver/transport/address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
///

class Transport2Widget extends StatefulWidget {
  late int carDirect = 0;
  final String letterCar;
  late String spriteImage = 'assets/images/sprites/C_sprite.png';
  late int startX = 0;
  late int startY = 0;

  final int speed;
  final int addressNumber;
  Transport2Widget(
      {super.key,
      required this.addressNumber,
      required this.letterCar,
      required this.speed});
  @override
  State<Transport2Widget> createState() => _Transport2WidgetState();
}

class _Transport2WidgetState extends State<Transport2Widget> {
  late List<List<String>> stateMap;
  late bool isWin = false;
  late Address mapAddress;

  //Car Cood
  late double _endX = 0.0;
  late double _endY = 0.0;
  late bool isVisible = true;
  late int stepDuration = 600 - widget.speed;

  @override
  void initState() {
    super.initState();
    mapAddress = gameAddress
        .firstWhere((element) => element.number == widget.addressNumber);
    widget.startX = mapAddress.startX;
    widget.startY = mapAddress.startY;
    widget.spriteImage = 'assets/images/sprites/${widget.letterCar}_sprite.png';
    stateMap = List.generate(
      mapAddress.initMap.length,
      (i) => List<String>.from(mapAddress.initMap[i]),
    );
    switch (mapAddress.flow.first) {
      case -3:
        widget.carDirect = 270;
        break;
      case -1:
        widget.carDirect = 90;
        break;
      case -2:
        widget.carDirect = 0;
        break;
      case -5:
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
          _endY -= width;
          widget.carDirect = 270;
          break;
        case 1:
          _endY += width;
          widget.carDirect = 90;
          break;
        case 2:
          _endX -= width;

          widget.carDirect = 180;
          break;
        case 0:
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

    // stateMap = level.initMap;
    final transportState = context.watch<TransportState>();

    final playerProgress = context.watch<PlayerProgress>();
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
              ? _width
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
                    hide: mapAddress.winMap[i][j] == "0" && isWin,
                    letter: _isStart ? widget.letterCar : data.first,
                    isBg: isBackground(data.first),
                    angle: int.parse(data.last),
                    onTap: () async {
                      setState(() {
                        context.read<AudioController>().playSfx(SfxType.rotate);

                        if (data.first == 'I') {
                          if (data[1] == '1') {
                            stateMap[i][j] = "I_0";
                          } else {
                            stateMap[i][j] = "I_1";
                          }
                        } else {
                          stateMap[i][j] =
                              '${data.first}_${(int.parse(data[1]) + 1) % 4}';
                        }
                        // Update the stateMap
                      });
                      if (checkMap(stateMap, mapAddress.winMap)) {
                        isWin = true;
                        context
                            .read<AudioController>()
                            .playSfx(SfxType.carStart);
                        await drivingCar(
                          mapAddress.flow,
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
                                milliseconds: stepDuration *
                                    mapAddress.flow.length), () async {
                          // Move to the next step
                          transportState.onTo();
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
              : Container()
        ]),
      ),
    );
  }
}
