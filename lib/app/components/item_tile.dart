import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/models/item.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool strikedText = false;

  @override
  initState() {
    strikedText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemModel>(context);
    final loadedItem = provider;
    return InkWell(
      onTap: () {
        setState(() {
          loadedItem.toggleDone();
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          loadedItem.item,
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              textStyle: loadedItem.isDone
                                  ? const TextStyle(
                                      color: Color.fromARGB(255, 195, 195, 195))
                                  : const TextStyle(),
                              decoration: loadedItem.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ),
                    ],
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
