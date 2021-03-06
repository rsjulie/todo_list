import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/models/item_list.dart';
import 'package:todo_list/pages/login.dart';
import 'package:todo_list/routes/auth_routers.dart';
import 'package:todo_list/routes/home_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemList(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Login(),
        getPages: [
          ...HomeRouters.routers,
          ...AuthRouters.routers,
        ],
      ),
    );
  }
}
