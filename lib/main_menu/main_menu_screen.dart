// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/player_progress/player_progress.dart';
import 'package:ev_driver/transport/finding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      AppLocalizations.of(context)!.taximode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: palette.backgroundMain,
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    audioController.playSfx(SfxType.buttonTap);
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
                    Icons.local_taxi_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          kIsWeb
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: settingsController.audioOn,
                            builder: (context, audioOn, child) {
                              return IconButton(
                                onPressed: () =>
                                    settingsController.toggleAudioOn(),
                                icon: Icon(
                                  audioOn ? Icons.volume_up : Icons.volume_off,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          const Text('Music by FanQuan',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
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
                      Icons.energy_savings_leaf,
                      color: palette.backgroundMain,
                    ),
                    Text(
                      playerProgress.money.toString(),
                      style: TextStyle(
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
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
                      Icons.local_taxi_outlined,
                      color: palette.backgroundMain,
                    ),
                    Text(
                      playerProgress.amountCar.toString(),
                      style: TextStyle(
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
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
