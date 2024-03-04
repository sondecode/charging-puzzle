// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const vehicleType = [
  VehicleType(
    number: 1,
    name: "VF1",
    cost: 50,
  ),
  VehicleType(
    number: 2,
    name: "VF3",
    cost: 0,
  ),
  VehicleType(
    number: 3,
    name: "VF5",
    cost: 50,
  ),
  VehicleType(
    number: 4,
    name: "VF6",
    cost: 50,
  )
];

class VehicleType {
  final int number;
  final int cost;

  final String name;

  const VehicleType({
    this.name = "VF1",
    required this.number,
    required this.cost,
  });
}
