import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTile extends StatefulWidget {
  String name;
  ItemTile({Key? key, required this.name}) : super(key: key);

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
    return InkWell(
      onTap: () {
        setState(() {
          strikedText = !strikedText;
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
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: GoogleFonts.raleway(
                                fontSize: 18,
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
