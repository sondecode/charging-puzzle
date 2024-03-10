// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:ev_driver/shopping/items.dart';
import 'package:flutter/foundation.dart';

import 'persistence/local_storage_player_progress_persistence.dart';
import 'persistence/player_progress_persistence.dart';

/// Encapsulates the player's progress.
class PlayerProgress extends ChangeNotifier {
  static const maxHighestScoresPerPlayer = 10;

  int _money = 0;

  int _maxEnergy = 5;

  int _curVehicle = 1;

  List<int> _bought = [1];

  /// By default, settings are persisted using
  /// [LocalStoragePlayerProgressPersistence] (i.e. NSUserDefaults on iOS,
  /// SharedPreferences on Android or local storage on the web).
  final PlayerProgressPersistence _store;

  int _highestLevelReached = 0;

  /// Creates an instance of [PlayerProgress] backed by an injected
  /// persistence [store].
  PlayerProgress({PlayerProgressPersistence? store})
      : _store = store ?? LocalStoragePlayerProgressPersistence() {
    _getLatestFromStore();
  }

  /// The highest level that the player has reached so far.
  int get highestLevelReached => _highestLevelReached;

  int get curVehicle => _curVehicle;

  int get money => _money;

  int get maxEnergy => _maxEnergy;

  int get amountCar => _bought.length;

  VehicleType get curVehicleInfo =>
      vehicleType.firstWhere((element) => element.number == _curVehicle);

  bool isBought(int number) {
    return _bought.contains(number);
  }

  void buyVehicle(int id) {
    int cost = vehicleType.firstWhere((element) => element.number == id).cost;
    // Check if cost is not null and if you have enough money to buy the vehicle
    if (_money >= cost && !isBought(id)) {
      _bought.add(id);
      _store.saveOwnVehicles(_bought);
      setMoney(-cost);
      notifyListeners();
    }
  }

  void useVehicle(int id) {
    if (_curVehicle != id) {
      int energy =
          vehicleType.firstWhere((element) => element.number == id).maxEnergy;
      _curVehicle = id;
      _maxEnergy = energy;
      _store.saveCurVehicle(id);
      notifyListeners();
    }
  }

  Future<void> setMoney(int earn) async {
    print(money);
    _money += earn;

    await _store.saveMoneyEarned(_money);
    notifyListeners();
  }

  /// Resets the player's progress so it's like if they just started
  /// playing the game for the first time.
  void reset() {
    _highestLevelReached = 0;
    notifyListeners();
    _store.saveHighestLevelReached(_highestLevelReached);
  }

  /// Registers [level] as reached.
  ///
  /// If this is higher than [highestLevelReached], it will update that
  /// value and save it to the injected persistence store.
  void setLevelReached(int level) {
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();

      unawaited(_store.saveHighestLevelReached(level));
    }
  }

  /// Fetches the latest data from the backing persistence store.
  Future<void> _getLatestFromStore() async {
    final level = await _store.getHighestLevelReached();
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();
    } else if (level < _highestLevelReached) {
      await _store.saveHighestLevelReached(_highestLevelReached);
    }
    //Money save
    final money = await _store.getMoneyEarned();
    if (money != _money) {
      _money = money;
      notifyListeners();
      // await _store.saveMoneyEarned(money);
    }
    //Vehicle save
    final item = await _store.getCurVehicle();
    if (item != _curVehicle) {
      int energy =
          vehicleType.firstWhere((element) => element.number == item).maxEnergy;
      _maxEnergy = energy;
      _curVehicle = item;
      notifyListeners();
      // await _store.saveMoneyEarned(money);
    }

    final items = await _store.getOwnVehicles();
    if (items != _bought) {
      _bought = items;
      notifyListeners();
      // await _store.saveMoneyEarned(money);
    }
  }
}
