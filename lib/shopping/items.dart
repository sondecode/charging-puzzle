// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const vehicleType = [
  VehicleType(
      number: 1,
      name: "feliz",
      cost: 10,
      speed: 80,
      bonus: 1,
      maxEnergy: 5,
      imgLink:
          "https://lh3.googleusercontent.com/proxy/KT8lqVCbWR0Q2W1_ULFPQ9AStK3mM79lq0aeD4esO0wVEseKavPXyQVdMvtznUSgZE_67aRZZZL5-R0NgTDhtMtEWdE0Tc0_CiUdcfSlLBXsiA"),
  VehicleType(
      number: 2,
      name: "vfe34",
      cost: 200,
      speed: 110,
      bonus: 1.2,
      maxEnergy: 7,
      imgLink:
          "https://vinfast-hatinh.vn/wp-content/uploads/2022/02/VinFast-VFe34-ngoa%CC%A3i-tha%CC%82%CC%81t.jpeg"),
  VehicleType(
      number: 3,
      name: "vf6",
      cost: 500,
      speed: 150,
      bonus: 1.5,
      maxEnergy: 10,
      imgLink:
          "https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwd5cf25f3/reserves/VF6/exterior-vf6-1.jpg"),
  VehicleType(
      number: 4,
      name: "vf7",
      cost: 1000,
      speed: 160,
      bonus: 1.9,
      maxEnergy: 15,
      imgLink: "https://vinfastotominhdao.vn/wp-content/uploads/vf7-2023.jpg"),
  VehicleType(
      number: 5,
      name: "vf8",
      cost: 2000,
      speed: 180,
      bonus: 2.2,
      maxEnergy: 15,
      imgLink:
          "https://www.vinfastvietnam.net.vn/uploads/data/3097/files/files/VINFAST%20VFE35/5F1DF5B0-B8ED-45F8-993B-755D9D014FBC.jpeg"),
  VehicleType(
      number: 6,
      name: "vf9",
      cost: 2500,
      speed: 200,
      bonus: 2.4,
      maxEnergy: 15,
      imgLink:
          "https://vinfastnewway.com.vn/wp-content/uploads/2022/03/vf9-anh-1.jpg"),
  VehicleType(
      number: 7,
      name: "vbus",
      cost: 5000,
      speed: 90,
      bonus: 3,
      maxEnergy: 15,
      imgLink:
          "https://storage.googleapis.com/digital-platform/hinh_anh_gia_ve_va_mang_luoi_tuyen_vinbus_vinhomes_smart_city_so_1_e8873a2418/hinh_anh_gia_ve_va_mang_luoi_tuyen_vinbus_vinhomes_smart_city_so_1_e8873a2418.jpg")
];

class VehicleType {
  final int number;
  final int cost;

  final int speed;
  final double bonus;
  final int maxEnergy;
  final String imgLink;

  final String name;

  const VehicleType({
    this.name = "vf1",
    required this.number,
    required this.maxEnergy,
    required this.imgLink,
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
