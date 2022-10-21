import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/app/data/dummy_data.dart';
import 'package:todo_list/app/models/item.dart';

class ItemList with ChangeNotifier {
  List<ItemModel> _items = dummy_items;
  List<ItemModel> get items => [..._items];

  void addItem(ItemModel item) {
    var id = Random().nextDouble().toString();
    _items.add(ItemModel(id: id, item: item.item, isDone: false));
    notifyListeners();
  }

  void updateItem(ItemModel item) {
    int index = items.indexWhere((p) => p.id == item.id);
    if (index >= 0) {
      _items[index] = item;
    }
    notifyListeners();
  }

  void removeItem(index, ItemModel item) {
    if (index >= 0) {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void loadIems() {
    var itemsBuffer = _items;
    _items.clear();
    _items = itemsBuffer;
  }
}
