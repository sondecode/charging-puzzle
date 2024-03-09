// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const vehicleType = [
  VehicleType(
      number: 1, name: "feliz", cost: 10, speed: 1, bonus: 1, maxEnergy: 5),
  VehicleType(
      number: 2, name: "vfe34", cost: 10, speed: 1.2, bonus: 1.2, maxEnergy: 7),
  VehicleType(
      number: 3, name: "vf6", cost: 50, speed: 1.3, bonus: 1.5, maxEnergy: 10),
  VehicleType(
      number: 4, name: "vf7", cost: 100, speed: 1, bonus: 2, maxEnergy: 15),
  VehicleType(
      number: 5, name: "vf8", cost: 100, speed: 1, bonus: 2, maxEnergy: 15),
  VehicleType(
      number: 6, name: "vf9", cost: 100, speed: 1, bonus: 2, maxEnergy: 15),
  VehicleType(
      number: 7, name: "vbus", cost: 100, speed: 1, bonus: 2, maxEnergy: 15)
];

class VehicleType {
  final int number;
  final int cost;

  final double speed;
  final double bonus;
  final int maxEnergy;

  final String name;

  const VehicleType({
    this.name = "vf1",
    required this.number,
    required this.maxEnergy,
    required this.speed,
    required this.bonus,
    required this.cost,
  });
}

VehicleType findCar(int id) {
  return vehicleType.firstWhere((element) => element.number == id);
}

Future<String> findCarName(int id) async {
  return vehicleType.firstWhere((element) => element.number == id).name;
}
