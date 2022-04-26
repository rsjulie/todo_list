import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/models/item.dart';
import 'package:todo_list/app/modules/home/home_controller.dart';
import 'package:todo_list/app/repositories/listitems_repository.dart';

class AddDialog extends GetView<HomeController> {
  String? item;
  final formKey = GlobalKey<FormState>();
  ListItemsRepository repository = ListItemsRepository();

  AddDialog({Key? key, this.item}) : super(key: key);

  _submit() {
    formKey.currentState?.save();
    var list = repository.findAll();
    list.add(
      ItemModel(
          id: Random().nextInt(100).toString(),
          item: controller.editTaskEC.text),
    );
    print(list[8].item);
    print(list);
    // Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Form(
        key: formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.editTaskEC,
                autofocus: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(229, 245, 245, 245)),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              padding: const EdgeInsets.only(top: 0, right: 10, bottom: 5),
              constraints: const BoxConstraints(),
              color: const Color.fromARGB(255, 0, 255, 8),
              icon: const Icon(
                Icons.check,
                size: 35,
              ),
              onPressed: () {
                _submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
