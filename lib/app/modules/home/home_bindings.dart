import 'package:get/get.dart';
import 'package:todo_list/app/repositories/listitems_repository.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ListItemsRepository>(ListItemsRepository());
    Get.put(HomeController(listRepository: Get.find()));
  }
}
