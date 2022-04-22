import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/app/components/item_tile.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  List<String> list = [
    'Julie',
    'Karen',
    'Ygor',
    'Ana Clara',
    'Ailton Ferreira da Silva'
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: [
                  Stack(
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
                                child: Text('MY -- LIST -',
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 5,
                                            fontSize: 68,
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
                                          itemCount: list.length,
                                          itemBuilder: (context, index) =>
                                              Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ItemTile(
                                                        name: list[index]),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                        radius: 8,
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors.grey[
                                                                            100]),
                                                          ),
                                                        ),
                                                        title: '',
                                                        middleText:
                                                            "Hello world!",
                                                        backgroundColor:
                                                            Colors.white,
                                                        titleStyle:
                                                            const TextStyle(
                                                                fontSize: 1),
                                                      );
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
                                                      list.removeAt(index);
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
                      Positioned(
                        left: (context.widthTransformer(reducedBy: 50) - 30),
                        bottom: 0,
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                const Color.fromARGB(255, 96, 0, 231),
                            child: IconButton(
                                splashColor: Colors.amber,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
