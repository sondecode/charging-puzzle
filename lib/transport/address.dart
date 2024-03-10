// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameAddress = [
  Address(
      name: "Home",
      number: 1,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["X_1", "L_3"],
        ["L_0", "L_1"],
        ["Y_0", "L_3"],
      ],
      winMap: [
        ["X_1", "0"],
        ["L_0", "L_2"],
        ["Y_0", "L_3"],
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2
      ]),
  Address(
      name: "Co2 certificate",
      number: 2,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["X_0", "I_1", "L_2"],
        ["L_2", "I_1", "L_3"],
        ["L_0", "I_0", "leaf_3"],
      ],
      winMap: [
        ["X_1", "0", "0"],
        ["L_0", "I_0", "L_2"],
        ["0", "0", "leaf_3"],
      ],
      flow: [
        -1,
        1,
        0,
        0,
        1
      ]),

  //LV3
  Address(
      name: "Home",
      number: 3,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      initMap: [
        ["X_0", "L_2", "L_3"],
        ["L_1", "L_1", "L_1"],
        ["L_0", "L_0", "0"],
        ["L_2", "L_2", "L_0"],
        ["L_2", "L_3", "house_2"]
      ],
      //-todo
      winMap: [
        ["X_1", "0", "0"],
        ["L_0", "L_2", "0"],
        ["L_1", "L_3", "0"],
        ["L_0", "L_2", "0"],
        ["0", "L_0", "house_2"]
      ],
      flow: [
        -1,
        1,
        0,
        1,
        2,
        1,
        0,
        1,
        0
      ]),
  //LV4
  Address(
      name: "Solar panel",
      number: 4,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startX: 1,
      startY: 4,
      initMap: [
        ['L_1', 'L_1', '0'],
        ['L_1', 'L_1', 'L_1'],
        ['I_1', 'L_0', 'L_1'],
        ['L_3', 'L_2', 'I_1'],
        ['0', 'X_1', 'solar_3']
      ],
      winMap: [
        ['0', '0', '0'],
        ['L_1', 'L_2', '0'],
        ['I_1', 'L_0', 'L_2'],
        ['L_0', 'L_2', 'I_1'],
        ['0', 'X_3', 'solar_3']
      ],
      flow: [
        -3,
        3,
        2,
        3,
        3,
        0,
        1,
        0,
        1,
        1
      ]),
  //LV5
  Address(
      name: "Wind turbine",
      number: 5,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startX: 0,
      startY: 1,
      initMap: [
        ['L_0', 'L_0', 'L_1'],
        ['X_2', 'I_1', 'L_1'],
        ['I_0', 'L_1', 'L_2'],
        ['L_3', 'L_3', 'turbine_2']
      ],
      winMap: [
        ['0', '0', '0'],
        ['X_0', 'I_0', 'L_2'],
        ['0', 'L_1', 'L_3'],
        ['0', 'L_0', 'turbine_2']
      ],
      flow: [
        -2,
        0,
        0,
        1,
        2,
        1,
        0
      ]),
  //LV7
  Address(
      name: "Car service",
      number: 6,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startY: 3,
      startX: 0,
      initMap: [
        ['L_1', 'L_1', 'service_1'],
        ['I_0', 'L_3', 'T_1'],
        ['I_0', 'L_2', 'I_0'],
        ['X_3', 'T_1', 'I_1'],
        ['S_0', 'I_1', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', 'service_1'],
        ['I_1', 'L_0', 'T_2'],
        ['I_1', '0', 'I_1'],
        ['X_3', '0', 'I_1'],
        ['S_0', 'I_0', 'L_3']
      ],
      flow: [
        -3,
        3,
        3,
        3,
        0,
        1,
        0,
        3,
      ]),
  //LV11
  Address(
      name: "Recycling",
      number: 7,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startY: 3,
      startX: 2,
      initMap: [
        ['L_2', 'L_1', 'L_1'],
        ['I_0', 'L_2', 'L_3'],
        ['I_1', 'recycling_0', 'L_3'],
        ['I_0', 'I_1', 'X_3'],
        ['T_3', 'I_0', 'L_0'],
        ['L_2', 'S_2', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', '0'],
        ['I_1', 'L_0', 'L_2'],
        ['I_1', 'recycling_0', 'L_3'],
        ['I_1', '0', 'X_1'],
        ['T_0', 'I_0', 'L_3'],
        ['L_0', 'S_2', '0']
      ],
      flow: [
        -1,
        1,
        2,
        2,
        3,
        3,
        3,
        3,
        0,
        1,
        0,
        1,
        2
      ]),
  //LV13
  Address(
      name: "Pollution",
      number: 8,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startX: 0,
      startY: 8,
      initMap: [
        ['T_2', 'waste_1', 'I_0', 'I_1'],
        ['I_2', 'T_2', 'L_2', 'L_3'],
        ['L_3', 'L_2', 'L_1', 'L_1'],
        ['L_1', 'L_1', 'I_0', 'tree_3'],
        ['L_1', 'T_0', 'L_0', 'T_2'],
        ['factory_0', 'L_3', 'L_1', 'L_1'],
        ['L_2', 'L_1', 'L_3', 'I_1'],
        ['I_0', 'L_1', 'L_2', 'L_0'],
        ['X_0', 'I_1', 'L_2', 'L_0']
      ],
      //to-do
      winMap: [
        ['0', 'waste_1', '0', '0'],
        ['0', 'T_0', 'L_2', '0'],
        ['L_1', 'L_3', 'L_0', 'L_2'],
        ['L_0', 'L_2', '0', 'tree_3'],
        ['0', 'T_0', 'L_2', '0'],
        ['factory_0', 'L_3', 'L_0', 'L_2'],
        ['0', '0', '0', 'I_1'],
        ['0', '0', 'L_1', 'L_3'],
        ['X_0', 'I_0', 'L_3', '0']
      ],
      flow: [
        -2,
        0,
        0,
        3,
        0,
        3,
        3,
        2,
        3,
        2,
        3,
        2,
        3,
        0,
        3,
        0,
        1,
        0,
        1
      ]),
  //LV16
  Address(
      name: "Bus stop",
      number: 9,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startX: 3,
      startY: 5,
      initMap: [
        ['L_1', 'L_1', 'L_1', 'L_1'],
        ['I_0', 'L_1', 'L_1', 'I_0'],
        ['I_0', '0', '0', 'busstop_3'],
        ['I_0', '0', '0', '0'],
        ['I_0', 'I_3', 'L_1', 'L_1'],
        ['T_3', 'L_1', 'L_2', 'X_1'],
        ['I_0', 'L_1', 'L_1', 'L_1'],
        ['I_0', '0', '0', '0'],
        ['I_0', '0', '0', 'busstop_1'],
        ['I_0', 'L_1', 'L_1', 'I_0'],
        ['L_1', 'L_1', 'L_1', 'L_1']
      ],
      winMap: [
        ['L_1', 'L_2', 'L_1', 'L_2'],
        ['I_1', 'L_0', 'L_3', 'I_1'],
        ['I_1', '0', '0', 'busstop_3'],
        ['I_1', '0', '0', '0'],
        ['I_1', '0', '0', '0'],
        ['T_0', 'L_2', 'L_1', 'X_2'],
        ['I_1', 'L_0', 'L_3', '0'],
        ['I_1', '0', '0', '0'],
        ['I_1', '0', '0', 'busstop_1'],
        ['I_1', 'L_1', 'L_2', 'I_1'],
        ['L_0', 'L_3', 'L_0', 'L_3']
      ],
      flow: [
        -5,
        2,
        1,
        2,
        3,
        2,
        1,
        1,
        1,
        1,
        1,
        0,
        3,
        0,
        1,
        0,
        3,
        3
      ]),
  //LV15
  Address(
      name: "Finish",
      number: 10,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      startX: 0,
      startY: 2,
      initMap: [
        ['L_1', 'I_0', 'L_1', 'S_1'],
        ['I_0', 'I_0', 'I_0', 'I_0'],
        ['X_2', 'L_1', 'T_3', 'L_1'],
        ['T_1', 'L_1', 'L_1', 'T_1'],
        ['T_1', 'L_1', 'L_1', 'L_1'],
        ['T_1', 'solar_1', 'L_1', 'L_1'],
        ['T_1', 'T_3', 'L_1', 'I_0'],
        ['T_1', 'I_0', 'L_1', 'I_1'],
        ['T_1', 'I_0', 'L_1', 'leaf_2'],
        ['T_1', 'T_3', 'L_1', 'I_0'],
        ['T_1', 'L_1', 'turbine_2', 'L_1']
      ],
      winMap: [
        ['L_1', 'I_0', 'L_2', 'S_1'],
        ['I_1', '0', 'I_1', 'I_1'],
        ['X_3', 'L_1', 'T_3', 'L_3'],
        ['0', 'L_0', 'L_2', '0'],
        ['0', '0', 'L_0', 'L_2'],
        ['0', 'solar_1', 'L_1', 'L_3'],
        ['0', 'T_0', 'L_3', '0'],
        ['0', 'I_1', '0', '0'],
        ['0', 'I_1', 'L_1', 'leaf_2'],
        ['0', 'T_0', 'L_3', '0'],
        ['0', 'L_0', 'turbine_2', '0']
      ],
      flow: [
        -3,
        3,
        3,
        0,
        0,
        1,
        1,
        2,
        1,
        0,
        1,
        0,
        1,
        2,
        1,
        2,
        1,
        1,
        1,
        0,
        3,
        0
      ]),
];

class Address {
  final int number;

  final int difficulty;

  final List<List<String>> initMap;

  final List<List<String>> winMap;

  final String name;

  final List<int> flow;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;
  final int startX;

  final int startY;

  bool get awardsAchievement => achievementIdAndroid != null;

  const Address({
    required this.number,
    this.name = "Home",
    this.startX = 0,
    this.startY = 0,
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
