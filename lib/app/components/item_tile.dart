import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  String name;
  ItemTile({Key? key, required this.name}) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool strikedText = true;

  @override
  initState() {
    strikedText = true;
    super.initState();
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
        padding: const EdgeInsets.only(left: 10),
        height: 62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 22,
                                decoration: strikedText
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
