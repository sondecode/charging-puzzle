// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

import 'player_progress_persistence.dart';

/// An implementation of [PlayerProgressPersistence] that uses
/// `package:shared_preferences`.
class LocalStoragePlayerProgressPersistence extends PlayerProgressPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<int> getHighestLevelReached() async {
    final prefs = await instanceFuture;
    return prefs.getInt('highestLevelReached') ?? 0;
  }

  @override
  Future<void> saveHighestLevelReached(int level) async {
    final prefs = await instanceFuture;
    await prefs.setInt('highestLevelReached', level);
  }

  @override
  Future<int> getMoneyEarned() async {
    final prefs = await instanceFuture;
    return prefs.getInt('moneyEarned') ?? 0;
  }

  @override
  Future<void> saveMoneyEarned(int money) async {
    final prefs = await instanceFuture;
    await prefs.setInt('moneyEarned', money);
  }

  @override
  Future<int> getCurVehicle() async {
    final prefs = await instanceFuture;
    return prefs.getInt('curVehicle') ?? 1;
  }

  @override
  Future<void> saveCurVehicle(int item) async {
    final prefs = await instanceFuture;
    await prefs.setInt('curVehicle', item);
  }

  @override
  Future<List<int>> getOwnVehicles() async {
    final prefs = await instanceFuture;
    final result = prefs.getString('curVehicle');
    if (result != null) {
      return result.split(',').map(int.parse).toList();
    }
    return [1];
  }

  @override
  Future<void> saveOwnVehicles(List<int> items) async {
    final prefs = await instanceFuture;
    await prefs.setString('curVehicle', items.join(','));
  }
}
