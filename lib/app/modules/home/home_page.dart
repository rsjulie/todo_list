import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/components/item_tile.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 242, 242, 242),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 200,
                      color: const Color.fromARGB(255, 43, 19, 181)),
                  SizedBox(
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Text(
                              'MY LIST',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 8,
                              child: Container(
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      const ItemTile(),
                                  itemCount: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
