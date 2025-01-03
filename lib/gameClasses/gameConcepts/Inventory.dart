import 'package:flutter/material.dart';

import '../ItemsConst/itemEnum.dart';

class InventoryData {
  // Private field to store inventory items
  final List<MapEntry<ItemEnum, int>> _inventory;

  // Constructor
  InventoryData(this._inventory);

  // Overload the [] operator to access the nth MapEntry
  MapEntry<ItemEnum, int> operator [](int index) {
    if (index < 0 || index >= _inventory.length) {
      return MapEntry(ItemEnum.none, 0);
    }
    return _inventory[index];
  }

  // Getter for the length of the inventory
  int get length => _inventory.length;

  // Method to add or update an item in the inventory
  void addItem(ItemEnum item, int count) {
    final existingEntryIndex =
    _inventory.indexWhere((entry) => entry.key == item);

    if (existingEntryIndex != -1) {
      // Update the existing item
      _inventory[existingEntryIndex] =
          MapEntry(item, _inventory[existingEntryIndex].value + count);
    } else {
      // Add a new item
      _inventory.add(MapEntry(item, count));
    }
  }

  // Method to remove an item from the inventory
  void removeItem(ItemEnum item) {
    _inventory.removeWhere((entry) => entry.key == item);
  }
}

final defaultInventory = InventoryData([
  MapEntry(ItemEnum.sword, 1),
  MapEntry(ItemEnum.bread, 1),
  MapEntry(ItemEnum.wood, 5),
]);