import 'package:get/get.dart';
import 'package:todo_list/app/modules/auth/login/login_bindings.dart';
import 'package:todo_list/app/modules/auth/register/register_bindings.dart';
import 'package:todo_list/app/modules/auth/register/register_page.dart';
import 'package:todo_list/pages/login.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => Login(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => RegisterPage(),
    )
  ];
}
