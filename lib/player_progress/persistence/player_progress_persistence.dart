// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An interface of persistence stores for the player's progress.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud saves.
abstract class PlayerProgressPersistence {
  Future<String> getUserId();

  Future<void> saveUserId(String id);

  Future<int> getHighestLevelReached();

  Future<void> saveHighestLevelReached(int level);

  Future<int> getMoneyEarned();

  Future<void> saveMoneyEarned(int money);

  Future<int> getCurVehicle();

  Future<void> saveCurVehicle(int item);

  Future<List<int>> getOwnVehicles();

  Future<void> saveOwnVehicles(List<int> items);
}
