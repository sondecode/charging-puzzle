// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Select level',
              style: TextStyle(fontFamily: 'Electric', fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: ListView(
            children: [
              for (final level in gameLevels)
                ListTile(
                  enabled:
                      playerProgress.highestLevelReached >= level.number - 1,
                  onTap: () {
                    final audioController = context.read<AudioController>();
                    audioController.playSfx(SfxType.buttonTap);

                    GoRouter.of(context).go('/play/session/${level.number}');
                  },
                  leading: Text(level.number.toString()),
                  title: Text('Level #${level.number}'),
                )
            ],
          ),
        ),
        MyButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text(
            'Back',
            style: TextStyle(
              color: Colors.blueGrey,
              fontFamily: 'Electric',
              fontSize: 25,
              height: 1,
            ),
          ),
        ),
        _gap,
      ]),
    );
  }
}
