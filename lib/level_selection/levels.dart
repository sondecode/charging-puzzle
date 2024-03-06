// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevels = [
  GameLevel(
      name: "Home",
      number: 1,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["C_1", "L_3"],
        ["L_0", "L_1"],
        ["S_0", "L_3"],
      ],
      winMap: [
        ["C_1", "0"],
        ["L_0", "L_2"],
        ["S_0", "L_3"],
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2
      ]),
  GameLevel(
      name: "Garage mot phuong troi rat xã xã xa",
      number: 2,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["T_0", "I_0", "L_2"],
        ["L_2", "I_0", "L_3"],
        ["L_0", "I_1", "S_3"],
      ],
      winMap: [
        ["T_1", "0", "0"],
        ["L_0", "I_1", "L_2"],
        ["0", "0", "S_3"],
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  GameLevel(
      name: "WC",
      number: 3,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["T_0", "I_0", "L_2"],
        ["L_2", "I_0", "L_3"],
        ["L_0", "I_1", "S_3"],
      ],
      winMap: [
        ["T_1", "0", "0"],
        ["L_0", "I_1", "L_2"],
        ["0", "0", "S_3"],
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
];

class GameLevel {
  final int number;

  final int difficulty;

  final List<List<String>> initMap;

  final List<List<String>> winMap;

  final String name;

  final List<int> flow;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
    required this.number,
    this.name = "Home",
    required this.difficulty,
    required this.initMap,
    required this.winMap,
    required this.flow,
    this.achievementIdIOS,
    this.achievementIdAndroid,
  }) : assert(
            (achievementIdAndroid != null && achievementIdIOS != null) ||
                (achievementIdAndroid == null && achievementIdIOS == null),
            'Either both iOS and Android achievement ID must be provided, '
            'or none');
}
