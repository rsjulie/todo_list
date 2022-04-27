import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/components/add_dialog.dart';
import 'package:todo_list/app/components/edit_dialog.dart';
import 'package:todo_list/app/components/item_tile.dart';
import 'package:todo_list/app/models/item_list.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  final HomeController controller =
      Get.put(HomeController(listRepository: Get.find()));
  final formKey = GlobalKey<FormState>();

  addDialog(ItemList loadedItems) {
    Get.defaultDialog(
      radius: 8,
      content: AddDialog(
        add: loadedItems.addItem,
      ),
      title: '',
      backgroundColor: const Color.fromARGB(106, 255, 255, 255),
      titleStyle: const TextStyle(fontSize: 1),
    );
  }

  editDialog(index, item) async {
    await Get.defaultDialog(
      radius: 8,
      content: EditDialog(
        index: index,
        item: item,
        edit: (_, __) {
          print('object');
        },
      ),
      title: '',
      backgroundColor: const Color.fromARGB(106, 255, 255, 255),
      titleStyle: const TextStyle(fontSize: 1),
    );
  }

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemList>(context);
    final loadedItems = provider;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addDialog(loadedItems);
        },
        backgroundColor: const Color.fromARGB(255, 81, 0, 255),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 81, 0, 157),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      'Sair',
                      style:
                          TextStyle(color: Color.fromARGB(255, 174, 102, 255)),
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Color.fromARGB(255, 174, 102, 255),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Container(
        // color: const Color.fromARGB(255, 242, 242, 242),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
                height: 350,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      Color.fromARGB(255, 89, 57, 250),
                      Color.fromARGB(255, 134, 0, 175)
                    ]))),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.heightTransformer(reducedBy: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 15, right: 30),
                              child: Text('MY ●● LIST ●',
                                  style: GoogleFonts.raleway(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 5,
                                          fontSize: 60,
                                          fontWeight: FontWeight.w500))),
                            ),
                            Expanded(
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                elevation: 15,
                                shadowColor: Colors.black,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  39, 90, 0, 187),
                                              width: 2)),
                                      padding: const EdgeInsets.all(20),
                                      child: ListView.builder(
                                        itemCount: loadedItems.items.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ItemTile(
                                                      name: loadedItems
                                                          .items[index].item),
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    editDialog(
                                                        index,
                                                        controller
                                                            .home[index].item);
                                                  },
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 30,
                                                          maxWidth: 30),
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.black54,
                                                    size: 22,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                IconButton(
                                                  onPressed: () {
                                                    loadedItems.items
                                                        .removeAt(index);
                                                  },
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 30,
                                                          maxWidth: 30),
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  iconSize: 22,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
