// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const vehicleType = [
  VehicleType(
    number: 1,
    name: "feliz",
    cost: 10,
    speed: 1,
    bonus: 1,
  ),
  VehicleType(
    number: 2,
    name: "C",
    cost: 10,
    speed: 1.2,
    bonus: 1.2,
  ),
  VehicleType(
    number: 3,
    name: "vf5",
    cost: 50,
    speed: 1.3,
    bonus: 1.5,
  ),
  VehicleType(
    number: 4,
    name: "vbus",
    cost: 100,
    speed: 1,
    bonus: 2,
  )
];

class VehicleType {
  final int number;
  final int cost;

  final double speed;
  final double bonus;

  final String name;

  const VehicleType({
    this.name = "vf1",
    required this.number,
    required this.speed,
    required this.bonus,
    required this.cost,
  });
}

VehicleType findCar(int id) {
  return vehicleType.firstWhere((element) => element.number == id);
}
