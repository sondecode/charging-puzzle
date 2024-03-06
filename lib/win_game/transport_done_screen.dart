// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/common/function.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../game_internals/score.dart';
import '../style/my_button.dart';
import '../style/palette.dart';

class TransportDoneScreen extends StatelessWidget {
  final int secondsElapsed;

  static const _gap = SizedBox(height: 20);

  const TransportDoneScreen({
    super.key,
    required this.secondsElapsed,
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
