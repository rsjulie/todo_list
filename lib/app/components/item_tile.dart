import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool strikedText = true;

  @override
  initState() {
    strikedText = true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          strikedText = !strikedText;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        child: Row(children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Text(
                'Name',
                style: TextStyle(
                    decoration: strikedText
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ]),
          ))
        ]),
      ),
    );
  }
}
