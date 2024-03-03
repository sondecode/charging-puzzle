// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/palette.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: Stack(children: [
        SizedBox(
          height: _height,
          width: _width,
          child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Image.asset('assets/images/sprites/background.png')),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Flutter Game Template!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Electric',
                  fontSize: 90,
                  height: 1,
                ),
              ),
              _gap,
              ElevatedButton(
                onPressed: () {
                  audioController.playSfx(SfxType.buttonTap);
                  GoRouter.of(context).go('/play');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20), // Remove padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust corner radius
                  ),
                  backgroundColor: Colors.green, // Set background color
                ),
                child: Icon(
                  size: 100,
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: ElevatedButton(
            onPressed: () => GoRouter.of(context).push('/settings'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20), // Remove padding
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust corner radius
              ),
              backgroundColor: Colors.green, // Set background color
            ),
            child: Icon(
              size: 30,
              Icons.settings,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }

  static const _gap = SizedBox(height: 100);
}
