// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/common/function.dart';
import 'package:basic/sprites/puzzle_tile.dart';
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
  const GameWidget({super.key});
  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late List<List<String>> stateMap;
  late bool isWin = false;

  @override
  void initState() {
    super.initState();
    final level = context.read<GameLevel>();
    stateMap = List.generate(
      level.initMap.length,
      (i) => List<String>.from(level.initMap[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.90;
    final double _height = MediaQuery.of(context).size.height * 0.90;

    final bool widthLarger = _width >= _height;
    final bool widthMapLarger = stateMap.first.length >= stateMap.length;

    final level = context.watch<GameLevel>();

    // stateMap = level.initMap;
    final levelState = context.watch<LevelState>();

    return SizedBox(
      height: _height,
      width: _height / stateMap.length * stateMap.first.length,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: GridView.builder(
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

                  return SizedBox(
                    child: PuzzleTile(
                      hide: level.winMap[i][j] == "0" && isWin,
                      type: stateMap[i][j],
                      onTap: () {
                        setState(() {
                          context.read<AudioController>().playSfx(SfxType.wssh);
                          final data = stateMap[i][j].split('_');
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
                          print(stateMap);
                          if (checkMap(stateMap, level.winMap)) {
                            isWin = true;
                            levelState.evaluate();
                          }
                        });
                      },
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
