import 'dart:io';

import 'package:apptest_tog/core/db/db_helper.dart';
import 'package:apptest_tog/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {

  static AddController get to => Get.find<AddController>();

  final TextEditingController namaC = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  final TextEditingController tinggi = TextEditingController();
  final TextEditingController berat = TextEditingController();
  // final file = File;
  DateTime tanggal = DateTime.now();

  Future<int?> addTask({User? user}) async {
   return await DbHelper.insert(user!);
  }


  File? image;
  String? imagePath;
  final _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      update();

      
    } else {
      print('No image selected.');
    }
  }
 
}
