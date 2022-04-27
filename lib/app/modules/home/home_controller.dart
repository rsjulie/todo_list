import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/models/item.dart';
import 'package:todo_list/app/models/item_list.dart';
import 'package:todo_list/app/repositories/listitems_repository.dart';

class HomeController extends GetxController {
  Rx<List<ItemList>> list = Rx<List<ItemList>>([]);
  final ListItemsRepository _listRepository;
  final home = <ItemModel>[].obs;
  final editTaskEC = TextEditingController();
  final _addTaskEC = TextEditingController();

  HomeController({required ListItemsRepository listRepository})
      : _listRepository = listRepository;

  @override
  void onReady() {
    Get.put(home);
    findAllItems();
    super.onReady();
  }

  void findAllItems() {
    final items = _listRepository.findAll();
    home.assignAll(items);
  }
}
