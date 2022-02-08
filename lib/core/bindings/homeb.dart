import 'package:apptest_tog/core/controllers/homec.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings{



  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }}