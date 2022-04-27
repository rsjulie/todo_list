import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/app/data/dummy_data.dart';
import 'package:todo_list/app/models/item.dart';

class ItemList with ChangeNotifier {
  final List<ItemModel> _items = dummy_items;
  List<ItemModel> get items => [..._items];

  Future<void> saveItem(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final product = ItemModel(id: '2', item: 'aaaaaaaaaaaaaa', isDone: true);
    if (hasId) {
      return updateItem(product);
    } else {
      return addItem(product);
    }
  }

  Future<void> addItem(ItemModel list) async {
    var id = Random().nextInt(1000).toString();
    items.add(ItemModel(id: id, item: list.item, isDone: true));
    notifyListeners();
  }

  Future<void> updateItem(ItemModel product) async {
    int index = items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      items[index] = product;
    }
    return Future.value();
  }

  Future<void> removeItem(ItemModel product) async {
    int index = items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      final product = items[index];
      items.remove(product);
    }
  }
}
