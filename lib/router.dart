// Copyright 2023, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:basic/play_session/play_session_screen.dart';
import 'package:basic/shopping/item_shopping.dart';
import 'package:basic/transport/finding.dart';
import 'package:basic/transport/transport_screen.dart';
import 'package:basic/win_game/transport_done_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'game_internals/score.dart';
import 'level_selection/level_selection_screen.dart';
import 'level_selection/levels.dart';
import 'main_menu/main_menu_screen.dart';
import 'settings/settings_screen.dart';
import 'style/my_transition.dart';
import 'style/palette.dart';
import 'win_game/win_game_screen.dart';

/// The router describes the game's navigational hierarchy, from the main
/// screen through settings screens all the way to each individual level.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
                  key: ValueKey('play'),
                  color: context.watch<Palette>().backgroundLevelSelection,
                  child: const LevelSelectionScreen(
                    key: Key('level selection'),
                  ),
                ),
            routes: [
              GoRoute(
                path: 'session/:level',
                pageBuilder: (context, state) {
                  final levelNumber = int.parse(state.pathParameters['level']!);
                  final level =
                      gameLevels.singleWhere((e) => e.number == levelNumber);
                  return buildMyTransition<void>(
                    key: ValueKey('level'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: PlaySessionScreen(
                      level,
                      key: const Key('play session'),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'won',
                redirect: (context, state) {
                  if (state.extra == null) {
                    // Trying to navigate to a win screen without any data.
                    // Possibly by using the browser's back button.
                    return '/';
                  }

                  // Otherwise, do not redirect.
                  return null;
                },
                pageBuilder: (context, state) {
                  final map = state.extra! as Map<String, dynamic>;
                  final score = map['score'] as Score;

                  return buildMyTransition<void>(
                    key: ValueKey('won'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: WinGameScreen(
                      score: score,
                      key: const Key('win game'),
                    ),
                  );
                },
              )
            ]),
        GoRoute(
          path: 'settings',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        GoRoute(
          path: 'shopping',
          builder: (context, state) =>
              const ItemShoppingScreen(key: Key('shopping')),
        ),
        GoRoute(
          path: 'transport',
          pageBuilder: (context, state) {
            Booking sample = state.extra as Booking;
            return buildMyTransition<void>(
              key: ValueKey('transport'),
              color: context.watch<Palette>().backgroundPlaySession,
              child: TransportScreen(
                booking: sample,
                key: const Key('transport'),
              ),
            );
          },
        ),
        GoRoute(
          path: 'done/:time',
          // redirect: (context, state) {
          //   if (state.extra == null) {
          //     // Trying to navigate to a win screen without any data.
          //     // Possibly by using the browser's back button.
          //     return '/';
          //   }

          //   // Otherwise, do not redirect.
          //   return null;
          // },
          pageBuilder: (context, state) {
            // final map = state.extra! as Map<String, dynamic>;
            // final score = map['score'] as Score;
            Booking sample = state.extra as Booking;
            final time = int.parse(state.pathParameters['time']!);
            return buildMyTransition<void>(
              key: ValueKey('done'),
              color: context.watch<Palette>().backgroundPlaySession,
              child: TransportDoneScreen(
                booking: sample,
                key: const Key('done transport'),
                secondsElapsed: time,
              ),
            );
          },
        )
      ],
    ),
  ],
);
