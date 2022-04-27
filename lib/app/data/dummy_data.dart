import 'dart:math';

import 'package:todo_list/app/models/item.dart';

final dummy_items = [
  ItemModel(
    id: Random().nextInt(1000).toString(),
    item: 'Julie',
    isDone: false,
  ),
  ItemModel(
    id: Random().nextInt(1000).toString(),
    item: 'Momore <3',
    isDone: false,
  ),
  ItemModel(
      id: Random().nextInt(1000).toString(),
      item: 'Ygor Santana',
      isDone: false),
];
