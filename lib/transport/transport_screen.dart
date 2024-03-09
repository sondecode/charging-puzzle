// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:ev_driver/common/function.dart';
import 'package:ev_driver/game_internals/transport_state.dart';
import 'package:ev_driver/player_progress/player_progress.dart';
import 'package:ev_driver/shopping/items.dart';
import 'package:ev_driver/transport/address.dart';
import 'package:ev_driver/transport/finding.dart';
import 'package:ev_driver/transport/transport2_widget.dart';
import 'package:ev_driver/transport/transport_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/confetti.dart';
import '../style/palette.dart';

/// This widget defines the entirety of the screen that the player sees when
/// they are playing a level.
///
/// It is a stateful widget because it manages some state of its own,
/// such as whether the game is in a "celebration" state.
class TransportScreen extends StatefulWidget {
  final Booking booking;

  const TransportScreen({super.key, required this.booking});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  //timer
  int _secondsElapsed = 0;
  Timer? _timer;

  static const _celebrationDuration = Duration(milliseconds: 2000);

  static const _preCelebrationDuration = Duration(milliseconds: 500);

  bool _duringCelebration = false;

  bool pickDone = false;

  late DateTime _startOfPlay;

  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();
    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     _secondsElapsed++;
    //   });
    // });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.read<Palette>();
    final playerProgress = context.read<PlayerProgress>();
    final _letterCar = findCar(playerProgress.curVehicle).name;

    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        Provider.value(value: widget.booking),
        // Create and provide the [LevelState] object that will be used
        // by widgets below this one in the widget tree.
        ChangeNotifierProvider(
          create: (context) => TransportState(
            onFrom: _pickSuccess,
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
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: _height,
                  width: _width,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                          'assets/images/sprites/background-dark.jpg')),
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
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    !pickDone
                                        ? gameAddress
                                            .firstWhere((element) =>
                                                element.number ==
                                                widget.booking.from)
                                            .name
                                        : gameAddress
                                            .firstWhere((element) =>
                                                element.number ==
                                                widget.booking.end)
                                            .name,
                                    style: TextStyle(
                                        fontFamily: 'Electric',
                                        fontSize: 30,
                                        height: 1,
                                        color: palette.backgroundMain),
                                  ),
                                  Text(
                                    formatDuration(
                                        Duration(seconds: _secondsElapsed)),
                                    style: TextStyle(
                                        fontFamily: 'Electric',
                                        fontSize: 30,
                                        height: 1,
                                        color: palette.backgroundMain),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      GoRouter.of(context).pop('/'),
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.all(20), // Remove padding
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
                                    padding:
                                        EdgeInsets.all(20), // Remove padding
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
                          children: [
                            !pickDone
                                ? TransportWidget(
                                    addressNumber: widget.booking.from,
                                    letterCar: _letterCar,
                                  )
                                : Transport2Widget(
                                    addressNumber: widget.booking.end,
                                    letterCar: _letterCar,
                                  )
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
      ),
    );
  }

  void _pickSuccess() {
    setState(() {
      pickDone = true;
    });
  }

  Future<void> _playerWon() async {
    // final score = Score(
    //   widget.level.number,
    //   widget.level.difficulty,
    //   DateTime.now().difference(_startOfPlay),
    // );
    // print(DateTime.now().difference(_startOfPlay)

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

    final playerProgress = context.read<PlayerProgress>();
    final distance = widget.booking.distance;
    final bonus = playerProgress.curVehicleInfo.bonus;
    final total = (distance * bonus).floor();

    playerProgress.setMoney(total);

    GoRouter.of(context).go('/done', extra: {
      'booking': widget.booking,
      'total': total,
      'secondsElapsed': _secondsElapsed
    });
  }
}
