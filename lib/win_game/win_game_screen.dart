// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/level_selection/levels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../game_internals/score.dart';
import '../style/my_button.dart';
import '../style/palette.dart';

class WinGameScreen extends StatelessWidget {
  final Score score;
  final String fact;

  static const _gap = SizedBox(height: 20);

  const WinGameScreen({
    super.key,
    required this.score,
    required this.fact,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

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
                'You won!',
                style: TextStyle(fontFamily: 'Electric', fontSize: 50),
              ),
            ),
            gap,
            Center(
              child: Text(
                'Score: ${score.score}\n'
                'Time: ${score.formattedTime}',
                style: const TextStyle(fontFamily: 'Electric', fontSize: 20),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Fact:',
              style: const TextStyle(fontFamily: 'Electric', fontSize: 20),
            ),
            Center(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                fact,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            )),
            Spacer(),
            MyButton(
              onPressed: () {
                GoRouter.of(context).go('/play');
              },
              child: const Text(
                'Continue',
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
