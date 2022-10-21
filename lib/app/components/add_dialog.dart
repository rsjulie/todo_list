import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/models/item.dart';
import 'package:todo_list/app/modules/home/home_controller.dart';

class AddDialog extends GetView<HomeController> {
  final formKey = GlobalKey<FormState>();
  final void Function(ItemModel) add;
  TextEditingController addController = TextEditingController();
  AddDialog({Key? key, required this.add}) : super(key: key);

  _submit() {
    formKey.currentState?.save();
    add(ItemModel(item: addController.text));
    Get.back();
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
                controller: addController,
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
