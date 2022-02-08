import 'package:apptest_tog/core/db/db_helper.dart';
import 'package:apptest_tog/core/routes/app_page.dart';
import 'package:apptest_tog/core/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: AppPage.pages,
    );
  }
}


