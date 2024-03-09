// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const gameLevels = [
  GameLevel(
      name: "Begin",
      number: 1,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Xe điện được trang bị động cơ chạy bằng điện vậy nên tiết kiệm nhiên liệu, ít gây ra khí thải. Để di chuyển xe điện cần sạc điện vào pin.",
      sprite: "C",
      initMap: [
        ["X_1", "L_3"],
        ["L_0", "L_1"],
        ["S_0", "L_3"],
      ],
      winMap: [
        ["X_1", "0"],
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
      name: "Co2 certificate",
      number: 2,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Xe điện thải ít khí nhà kính (CO2) hơn xe động cơ đốt trong. CO2 Certificate có thể được dùng để mua vật phẩm trong trò chơi này.",
      sprite: "C",
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
  GameLevel(
      name: "Home",
      number: 3,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Xe điện có thể tạo ra một môi trường yên tĩnh hơn khi di chuyển, đặc biệt là trong khu vực đô thị và các khu dân cư nhỏ.",
      sprite: "C",
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
  GameLevel(
      name: "Solar panel",
      number: 4,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Sử dụng năng lượng mặt trời giúp giảm lượng khí thải carbon được sinh ra từ việc sử dụng năng lượng hóa thạch, giúp giảm thiểu ảnh hưởng đến biến đổi khí hậu và môi trường.",
      sprite: "C",
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
  GameLevel(
      name: "Wind turbine",
      number: 5,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Tua bin gió sử dụng sức gió để tạo ra năng lượng điện, đây là một nguồn năng lượng tái tạo không giới hạn, giúp giảm đi chi phí điện hàng tháng.",
      sprite: "C",
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
  GameLevel(
      name: "Car service",
      number: 6,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Bảo trì xe điện đơn giản và tiết kiệm hơn xe xăng do có ít bộ phận chuyển động và không cần thay dầu động cơ, nhưng vẫn cần thực hiện định kỳ để đảm bảo hiệu suất và an toàn.",
      sprite: "C",
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
  GameLevel(
      name: "Recycling",
      number: 7,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Xe điện có thể tái chế đến 70% của các thành phần và vật liệu để giảm lượng rác thải và tối ưu hóa sự bền vững.",
      sprite: "C",
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
  GameLevel(
      name: "Pollution",
      number: 8,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Ở một số quốc gia, các tội phạm môi trường có thể nhận án phạt cực kỳ nặng, bao gồm cả án tù dài hạn, phạt tiền lớn, hoặc cả hai, do hậu quả của hành vi của họ gây ra cho môi trường và sức khỏe của cộng đồng có thể rất nghiêm trọng",
      sprite: "police",
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
  GameLevel(
      name: "Bus stop",
      number: 9,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Sử dụng phương tiện công cộng không chỉ là một cách hiệu quả để giảm lượng ô nhiễm môi trường mà còn mang lại nhiều lợi ích khác cho môi trường sống và sức khỏe của cộng đồng.",
      sprite: "vbus",
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
  GameLevel(
      name: "Finish",
      number: 10,
      difficulty: 5,
      achievementIdIOS: 'first_win',
      achievementIdAndroid: 'NhkIwB69ejkMAOOLDb',
      fact:
          "Mọi người cần cùng nhau góp sức để xây dựng một tương lai bền vững cho hành tinh chúng ta.",
      sprite: "police",
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

class GameLevel {
  final int number;

  final int difficulty;

  final List<List<String>> initMap;

  final List<List<String>> winMap;

  final String name;

  final String sprite;

  final String fact;

  final int startX;

  final int startY;

  final List<int> flow;

  /// The achievement to unlock when the level is finished, if any.
  final String? achievementIdIOS;

  final String? achievementIdAndroid;

  bool get awardsAchievement => achievementIdAndroid != null;

  const GameLevel({
    required this.sprite,
    required this.number,
    this.startX = 0,
    this.startY = 0,
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
