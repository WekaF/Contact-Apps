import 'package:apptest_tog/core/db/db_helper.dart';
import 'package:apptest_tog/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
 

  List<User> userList = <User>[].obs;

  @override
  void onReady() {
    getUser();
    super.onReady();
  }

  Future<void> getUser() async {
    List<Map<String, dynamic>> user = await DbHelper.query();
    userList.assignAll(user.map((data) => new User.fromMap(data)).toList());
   }

  //  Future<int?> addTask({User? user}) async {
  //   return await DbHelper.insert(user!);
  // }

  void delete(User user) {
    var val = DbHelper.delete(user);
    print(val);
  }
}
