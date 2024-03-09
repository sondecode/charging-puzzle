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
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ["X_1", "L_3"],
        ["L_0", "L_1"],
        ["leaf_0", "L_3"],
      ],
      winMap: [
        ["X_1", "0"],
        ["L_0", "L_2"],
        ["leaf_0", "L_3"],
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2
      ]),
  GameLevel(
      name: "Garage",
      number: 2,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "C",
      initMap: [
        ["X_0", "I_1", "L_2"],
        ["L_2", "I_1", "L_3"],
        ["L_0", "I_0", "S_3"],
      ],
      winMap: [
        ["X_1", "0", "0"],
        ["L_0", "I_0", "L_2"],
        ["0", "0", "S_3"],
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),

  //LV3
  GameLevel(
      name: "Station",
      number: 3,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ["X_0", "L_2", "L_3"],
        ["L_1", "L_1", "L_1"],
        ["L_0", "L_0", "L_1"],
        ["L_2", "L_2", "L_0"],
        ["L_2", "L_3", "S_2"]
      ],
      //-todo
      winMap: [
        ["X_1", "0", "0"],
        ["L_0", "L_2", "0"],
        ["L_1", "L_3", "0"],
        ["L_0", "L_2", "0"],
        ["0", "L_0", "S_2"]
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2
      ]),
  //LV4
  GameLevel(
      name: "WC",
      number: 4,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_1', 'L_1', '0'],
        ['L_1', 'L_1', 'L_1'],
        ['I_1', 'L_0', 'L_1'],
        ['L_3', 'L_2', 'I_1'],
        ['0', 'X_1', 'S_3']
      ],
      winMap: [
        ['0', '0', '0'],
        ['L_1', 'L_2', '0'],
        ['I_1', 'L_0', 'L_2'],
        ['L_0', 'L_2', 'I_1'],
        ['0', 'X_3', 'S_3']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV5
  GameLevel(
      name: "WC",
      number: 5,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_0', 'L_0', 'L_1'],
        ['X_2', 'I_1', 'L_1'],
        ['I_0', 'L_1', 'L_2'],
        ['L_3', 'L_3', 'S_2']
      ],
      winMap: [
        ['0', '0', '0'],
        ['X_0', 'I_0', 'L_2'],
        ['0', 'L_1', 'L_3'],
        ['0', 'L_0', 'S_2']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV7
  GameLevel(
      name: "WC",
      number: 6,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_1', 'L_1', 'S_1'],
        ['I_0', 'L_3', 'T_1'],
        ['I_0', '0', 'I_0'],
        ['X_3', '0', 'I_1'],
        ['S_0', 'I_0', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', 'S_1'],
        ['I_1', 'L_0', 'T_2'],
        ['I_1', '0', 'I_1'],
        ['X_3', '0', 'I_1'],
        ['S_0', 'I_0', 'L_3']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV11
  GameLevel(
      name: "WC",
      number: 7,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_2', 'L_1', 'L_1'],
        ['I_0', 'L_2', 'L_3'],
        ['I_1', 'S_0', 'L_3'],
        ['I_0', 'I_1', 'X_3'],
        ['T_3', 'I_0', 'L_0'],
        ['L_2', 'S_2', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', '0'],
        ['I_1', 'L_0', 'L_2'],
        ['I_1', 'S_0', 'L_3'],
        ['I_1', '0', 'X_1'],
        ['T_0', 'I_0', 'L_3'],
        ['L_0', 'S_2', '0']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV13
  GameLevel(
      name: "WC",
      number: 8,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['T_2', 'S_1', 'I_0', 'I_1'],
        ['L_2', 'T_2', 'L_2', 'L_3'],
        ['L_3', 'L_2', 'L_1', 'L_1'],
        ['L_1', 'L_1', 'I_0', 'S_3'],
        ['L_1', 'T_0', 'L_0', 'T_2'],
        ['S_0', 'L_3', 'L_1', 'L_1'],
        ['L_2', 'L_1', 'L_3', 'I_1'],
        ['I_0', 'L_1', 'L_2', 'L_0'],
        ['X_0', 'I_1', 'L_2', 'L_0']
      ],
      //to-do
      winMap: [
        // ['0', 'S_1', '0', '0'],
        // ['0', 'T_0', 'L_2', '0'],
        // ['L_1', 'L_3', 'L_1', 'L_2'],
        // ['L_1', 'L_2', '0', 'S_3'],
        // ['0', 'T_1', 'L_2', '0'],
        // ['S_0', 'L_3', 'L_0', 'L_2'],
        // ['0', '0', '0', 'I_1'],
        // ['0', '0', 'L_1', 'L_3'],
        // ['C_0', 'I_0', 'L_3', '0']

        ['0', 'S_1', '0', '0'],
        ['L_1', 'T_3', 'L_2', '0'],
        ['L_0', 'L_2', 'L_0', 'L_2'],
        ['L_1', 'L_3', '0', 'S_3'],
        ['L_0', 'T_1', 'L_2', '0'],
        ['S_0', 'L_3', 'L_0', 'L_2'],
        ['0', '0', '0', 'I_1'],
        ['0', '0', 'L_1', 'L_3'],
        ['X_0', 'I_0', 'L_3', '0']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV16
  GameLevel(
      name: "WC",
      number: 9,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_1', 'L_1', 'L_1', 'L_1'],
        ['I_0', 'L_1', 'L_1', 'I_0'],
        ['I_0', '0', '0', 'S_3'],
        ['I_0', '0', '0', '0'],
        ['I_0', 'L_1', 'L_1', 'L_1'],
        ['T_3', 'L_1', 'L_1', 'X_2'],
        ['I_0', 'L_1', 'L_1', 'L_1'],
        ['I_0', '0', '0', '0'],
        ['I_0', '0', '0', 'S_1'],
        ['I_0', 'L_1', 'L_1', 'I_0'],
        ['L_1', 'L_1', 'L_1', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', 'L_1', 'L_2'],
        ['I_1', 'L_0', 'L_3', 'I_1'],
        ['I_1', '0', '0', 'S_3'],
        ['I_1', '0', '0', '0'],
        ['I_1', '0', '0', '0'],
        ['T_1', 'L_2', 'L_1', 'X_2'],
        ['I_1', 'L_1', 'L_3', '0'],
        ['I_1', '0', '0', '0'],
        ['I_1', '0', '0', 'S_1'],
        ['I_1', 'L_1', 'L_2', 'I_1'],
        ['L_0', 'L_3', 'L_0', 'L_3']
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),
  //LV15
  GameLevel(
      name: "WC",
      number: 10,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact: "Xe điện giảm lượng khí thải nhà kính hơn xe xăng",
      sprite: "police",
      initMap: [
        ['L_1', 'I_0', 'L_1', 'S_1'],
        ['I_0', 'I_0', 'I_0', 'I_0'],
        ['X_2', 'L_1', 'T_3', 'L_1'],
        ['0', 'L_1', 'L_1', 'L_1'],
        ['0', 'L_1', 'L_1', 'L_1'],
        ['0', 'S_1', 'L_1', 'L_1'],
        ['0', 'T_3', 'L_1', 'I_0'],
        ['0', 'I_0', 'L_1', 'L_1'],
        ['0', 'I_0', 'L_1', 'S_2'],
        ['0', 'T_3', 'L_1', 'I_0'],
        ['0', 'L_1', 'S_2', 'L_1']
      ],
      winMap: [
        ['L_1', 'I_0', 'L_2', 'S_1'],
        ['I_1', '0', 'I_1', 'I_1'],
        ['X_3', 'L_1', 'T_3', 'L_3'],
        ['0', 'L_0', 'L_2', '0'],
        ['0', '0', 'L_0', 'L_2'],
        ['0', 'S_1', 'L_1', 'L_3'],
        ['0', 'T_0', 'L_3', '0'],
        ['0', 'I_1', '0', '0'],
        ['0', 'I_1', 'L_1', 'S_2'],
        ['0', 'T_0', 'L_3', '0'],
        ['0', 'L_0', 'S_2', '0']
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

  final String sprite;

  final String fact;

  final List<int> flow;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
    required this.sprite,
    required this.number,
    this.name = "Home",
    required this.fact,
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
