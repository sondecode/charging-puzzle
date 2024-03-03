// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevels = [
  GameLevel(
      number: 1,
      difficulty: 5,
      // TODO: When ready, change these achievement IDs.
      // You configure this in App Store Connect.
      achievementIdIOS: 'first_win',
      // You get this string when you configure an achievement in Play Console.
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        // Represent the initial grid state using a 2D list of strings
        // "E": empty space, "C": car, "S": solar panel, "1-X": puzzle piece IDs
        ["C_1", "L_3"],
        ["L_0", "L_1"],
        ["S_0", "L_3"],
        // Add more rows as needed based on your grid size
      ],
      winMap: [
        // Represent the initial grid state using a 2D list of strings
        // "E": empty space, "C": car, "S": solar panel, "1-X": puzzle piece IDs
        ["C_1", "0"],
        ["L_0", "L_2"],
        ["S_0", "L_3"],
        // Add more rows as needed based on your grid size
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2
      ]),
  GameLevel(
      number: 2,
      difficulty: 5,
      // TODO: When ready, change these achievement IDs.
      // You configure this in App Store Connect.
      achievementIdIOS: 'first_win',
      // You get this string when you configure an achievement in Play Console.
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        // Represent the initial grid state using a 2D list of strings
        // "E": empty space, "C": car, "S": solar panel, "1-X": puzzle piece IDs
        ["T_0", "I_0", "L_2"],
        ["L_2", "I_0", "L_3"],
        ["L_0", "I_1", "S_3"],

        // Add more rows as needed based on your grid size
      ],
      winMap: [
        // Represent the initial grid state using a 2D list of strings
        // "E": empty space, "C": car, "S": solar panel, "1-X": puzzle piece IDs
        ["T_1", "0", "0"],
        ["L_0", "I_1", "L_2"],
        ["0", "0", "S_3"],

        // Add more rows as needed based on your grid size
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  // GameLevel(
  //   number: 2,
  //   difficulty: 42,
  // ),
  // GameLevel(
  //   number: 3,
  //   difficulty: 62,
  // ),
  // GameLevel(
  //   number: 4,
  //   difficulty: 100,
  //   achievementIdIOS: 'finished',
  //   achievementIdAndroid: 'CdfIhE96aspNWLGSQg',
  // ),
];

class GameLevel {
  final int number;

  final int difficulty;

  final List<List<String>> initMap;

  final List<List<String>> winMap;

  final List<int> flow;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
    required this.number,
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
