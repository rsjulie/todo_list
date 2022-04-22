import 'package:get/get.dart';
import 'package:todo_list/app/modules/home/home_bindings.dart';
import 'package:todo_list/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
