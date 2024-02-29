// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

/// This widget defines the game UI itself, without things like the settings
/// button or the back button.
///
class PuzzleTile extends StatefulWidget {
  final String type; // Tile type (e.g., "C_2", "L_1", "S_1")
  // final bool isFixed; // Whether the tile is fixed (like the solar panel)
  final Function onTap;
  const PuzzleTile({super.key, required this.type, required this.onTap});

  @override
  State<PuzzleTile> createState() => _PuzzleTileState();
}

class _PuzzleTileState extends State<PuzzleTile> {
  double rotationAngle = 0.0;
  @override
  Widget build(BuildContext context) {
    // Replace placeholders with the actual image paths based on your tile types
    final image = Image.asset('assets/images/sprites/pipe-straight-white.png');

    return GestureDetector(
        onTap: () {
          print(rotationAngle);
          setState(() {
            rotationAngle += 90.0;
            if (rotationAngle == 360) rotationAngle = 0;
          });
          widget.onTap(); // Call the onTap callback function
        },
        child: Transform.rotate(
          angle: rotationAngle * (3.14159265359 / 180),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.grey),
            ),
            child: image,
            // Center(child: Text(widget.type)),
          ),
        ));
  }
}

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  Widget build(BuildContext context) {
    final level = context.watch<GameLevel>();
    final levelState = context.watch<LevelState>();

    return SizedBox(
      child: Stack(children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: SingleChildScrollView(
              // physics: const NeverScrollableScrollPhysics(),
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: level.initMap.first.length,
                  ),
                  itemCount: level.initMap.length * level.initMap.first.length,
                  // Adjust based on your grid size
                  itemBuilder: (context, index) {
                    int i, j = 0;
                    i = (index / level.initMap.first.length).floor();
                    j = (index % level.initMap.first.length);

                    return SizedBox(
                      child: PuzzleTile(
                        type: level.initMap[i][j],
                        onTap: () {
                          setState(() {
                            // Change the color of the tile to red
                            // You can add logic here to change color conditionally
                          });
                        },
                      ),
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}
