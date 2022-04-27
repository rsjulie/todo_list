import 'package:flutter/material.dart';

class ItemModel with ChangeNotifier {
  final String id;
  late String item;
  late bool isDone;

  ItemModel({required this.id, required this.item, required this.isDone});

  toggleDone() {
    isDone = !isDone;
    notifyListeners();
  }
}
