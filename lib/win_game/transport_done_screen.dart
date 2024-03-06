// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/common/function.dart';
import 'package:basic/player_progress/player_progress.dart';
import 'package:basic/settings/settings.dart';
import 'package:basic/transport/finding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/my_button.dart';
import '../style/palette.dart';

class TransportDoneScreen extends StatelessWidget {
  final int secondsElapsed;
  final Booking booking;

  static const _gap = SizedBox(height: 20);

  const TransportDoneScreen({
    super.key,
    required this.secondsElapsed,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();
    final settings = context.watch<SettingsController>();

    final _distance = booking.distance;
    final _bonus = playerProgress.curVehicleInfo.bonus;
    final _total = _distance * _bonus;

    playerProgress.setMoney(_total.floor());

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gap,
            const Center(
              child: Text(
                'Done!',
                style: TextStyle(fontFamily: 'Electric', fontSize: 50),
              ),
            ),
            gap,
            Center(
              child: Text(
                formatDuration(Duration(seconds: secondsElapsed)),
                style: const TextStyle(fontFamily: 'Electric', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.face, size: 100),
                  ValueListenableBuilder(
                    valueListenable: settings.playerName,
                    builder: (context, name, child) => Text(
                      'Driver: $name',
                      style: const TextStyle(
                        fontFamily: 'Electric',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Distance',
                        style: TextStyle(
                          fontFamily: 'Electric',
                          fontSize: 30,
                        ),
                      ),
                      Text("${booking.distance} km",
                          style: const TextStyle(
                            fontFamily: 'Electric',
                            fontSize: 30,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                            fontFamily: 'Electric',
                            fontSize: 30,
                          )),
                      Text("\$$_total",
                          style: const TextStyle(
                            fontFamily: 'Electric',
                            fontSize: 30,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            MyButton(
              onPressed: () {
                GoRouter.of(context).go('/');
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
            _gap
          ],
        ),
      ),
    );
  }
}
