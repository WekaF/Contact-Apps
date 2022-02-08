import 'package:apptest_tog/core/controllers/addc.dart';
import 'package:get/instance_manager.dart';

class AddB implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddController>(() => AddController());
  }

}