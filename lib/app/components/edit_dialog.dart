import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/repositories/listitems_repository.dart';

class EditDialog extends StatefulWidget {
  String? item;
  final int index;
  final void Function(int, int) edit;

  EditDialog({Key? key, this.index = 0, this.item, required this.edit})
      : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final formKey = GlobalKey<FormState>();

  TextEditingController editcontroller = TextEditingController();

  ListItemsRepository repository = ListItemsRepository();

  @override
  void initState() {
    super.initState();
    editcontroller = TextEditingController(text: widget.item);
  }

  _submit() {
    formKey.currentState?.save();
    widget.edit(widget.index, widget.index);
    // widget.edit(
    //   ItemModel(
    //     id: Random().nextInt(100).toString(),
    //     item: editcontroller.text,
    //   ),
    // );
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
                controller: editcontroller..text,
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
