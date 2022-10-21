import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/models/item.dart';
import 'package:todo_list/app/models/item_list.dart';
import 'package:todo_list/app/repositories/listitems_repository.dart';

class UpdateDialog extends StatefulWidget {
  ItemModel item;
  final void Function(ItemModel) update;

  UpdateDialog({
    Key? key,
    required this.item,
    required this.update,
  }) : super(key: key);

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  final formKey = GlobalKey<FormState>();

  TextEditingController updatecontroller = TextEditingController();

  ListItemsRepository repository = ListItemsRepository();

  @override
  void initState() {
    super.initState();
    updatecontroller = TextEditingController(text: widget.item.item);
  }

  _submit() {
    formKey.currentState?.save();
    widget.item.item = updatecontroller.text;
    widget.update(widget.item);
    Get.back();
    Provider.of<ItemList>(context, listen: false).loadIems();
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
                controller: updatecontroller..text,
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
