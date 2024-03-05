// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/player_progress/player_progress.dart';
import 'package:basic/transport/finding.dart';
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
    final playerProgress = context.watch<PlayerProgress>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
            height: _height,
            width: _width,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/sprites/background.png')),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sprites/logo.png',
                  width: 600,
                ),
                // const Text(
                //   'Electric Vehicles\nDriver!',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontFamily: 'Electric',
                //     fontSize: 90,
                //     height: 1,
                //   ),
                // ),
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
                    size: 120,
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                _gap,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'finding customers:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: palette.backgroundMain,
                      fontFamily: 'Electric',
                      fontSize: 30,
                      height: 1,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RadarDialog();
                      },
                    );
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
                    size: 50,
                    Icons.radar,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => GoRouter.of(context).push('/shopping'),
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
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
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
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      size: 40,
                      Icons.monetization_on,
                      color: palette.backgroundMain,
                    ),
                    Text(
                      playerProgress.money.toString(),
                      style: TextStyle(
                        fontFamily: 'Electric',
                        fontSize: 30,
                        height: 1,
                        color: palette.backgroundMain,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      size: 40,
                      Icons.energy_savings_leaf,
                      color: palette.backgroundMain,
                    ),
                    Text(
                      playerProgress.energy.toString(),
                      style: TextStyle(
                        fontFamily: 'Electric',
                        fontSize: 30,
                        height: 1,
                        color: palette.backgroundMain,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  static const _gap = SizedBox(height: 50);
}
