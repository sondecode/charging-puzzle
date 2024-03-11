// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/common/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'levels.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.selectLevel,
                style: TextStyle(
                    fontFamily: 'Square',
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
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
                    leading: Text(
                      level.number.toString(),
                      style: TextStyle(
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                    title: Text(
                      transNameLevel(context, level.number),
                      style: TextStyle(
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                  )
              ],
            ),
          ),
          MyButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              AppLocalizations.of(context)!.back,
              style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Square',
                fontStyle: FontStyle.italic,
                fontSize: 25,
                height: 1,
              ),
            ),
          ),
          _gap,
        ]),
      ),
    );
  }
}
