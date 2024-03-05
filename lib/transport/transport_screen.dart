// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:basic/game_internals/transport_state.dart';
import 'package:basic/transport/finding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../game_internals/score.dart';
import '../level_selection/levels.dart';
import '../player_progress/player_progress.dart';
import '../style/confetti.dart';
import '../style/palette.dart';

/// This widget defines the entirety of the screen that the player sees when
/// they are playing a level.
///
/// It is a stateful widget because it manages some state of its own,
/// such as whether the game is in a "celebration" state.
class TransportScreen extends StatefulWidget {
  final Booking booking;

  const TransportScreen(this.booking, {super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  static const _gap = SizedBox(height: 20);

  static final _log = Logger('TransportScreen');

  static const _celebrationDuration = Duration(milliseconds: 2000);

  static const _preCelebrationDuration = Duration(milliseconds: 500);

  bool _duringCelebration = false;

  late DateTime _startOfPlay;

  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        Provider.value(value: widget.booking),
        // Create and provide the [LevelState] object that will be used
        // by widgets below this one in the widget tree.
        ChangeNotifierProvider(
          create: (context) => TransportState(
            onFrom: _playerWon,
            onTo: _playerWon,
          ),
        ),
      ],
      child: IgnorePointer(
        // Ignore all input during the celebration animation.
        ignoring: _duringCelebration,
        child: Scaffold(
          backgroundColor: palette.backgroundPlaySession,
          // The stack is how you layer widgets on top of each other.
          // Here, it is used to overlay the winning confetti animation on top
          // of the game.
          body: Stack(
            children: [
              SizedBox(
                height: _height,
                width: _width,
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Image.asset('assets/images/sprites/background.png')),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.booking.customer.name,
                            style: TextStyle(
                              fontFamily: 'Electric',
                              fontSize: 30,
                              height: 1,
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => GoRouter.of(context).pop('/'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20), // Remove padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust corner radius
                                  ),
                                  backgroundColor:
                                      Colors.green, // Set background color
                                ),
                                child: Icon(
                                  size: 30,
                                  Icons.home,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    GoRouter.of(context).push('/settings'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20), // Remove padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust corner radius
                                  ),
                                  backgroundColor:
                                      Colors.green, // Set background color
                                ),
                                child: Icon(
                                  size: 30,
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      // The actual UI of the game.
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // TransportWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // This is the confetti animation that is overlaid on top of the
              // game when the player wins.
              SizedBox.expand(
                child: Visibility(
                  visible: _duringCelebration,
                  child: IgnorePointer(
                    child: Confetti(
                      isStopped: !_duringCelebration,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _playerWon() async {
    // final score = Score(
    //   widget.level.number,
    //   widget.level.difficulty,
    //   DateTime.now().difference(_startOfPlay),
    // );

    // final playerProgress = context.read<PlayerProgress>();
    // playerProgress.setLevelReached(widget.level.number);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/');
  }
}
