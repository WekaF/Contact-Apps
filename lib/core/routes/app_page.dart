import 'package:apptest_tog/core/bindings/addb.dart';
import 'package:apptest_tog/core/bindings/homeb.dart';
import 'package:apptest_tog/core/routes/app_route.dart';
import 'package:apptest_tog/core/ui/add_user.dart';
import 'package:apptest_tog/core/ui/homepage.dart';
import 'package:get/route_manager.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: Approute.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Approute.AddUser,
      page: () => AddUser(),
      binding: AddB(),
    ),
  ];
}
