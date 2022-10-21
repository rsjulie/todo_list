import 'package:flutter/material.dart';

class ItemModel with ChangeNotifier {
  final String? id;
  late String item;
  late bool isDone;

  ItemModel({this.id, required this.item, this.isDone = false});

  toggleDone() {
    isDone = !isDone;
    notifyListeners();
  }
}
