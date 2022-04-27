import 'package:todo_list/app/data/dummy_data.dart';
import 'package:todo_list/app/models/item.dart';

class ListItemsRepository {
  List<ItemModel> findAll() {
    return dummy_items;
  }
}
