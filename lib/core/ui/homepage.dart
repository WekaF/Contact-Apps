import 'package:apptest_tog/core/controllers/homec.dart';
import 'package:apptest_tog/core/models/user.dart';
import 'package:apptest_tog/core/ui/add_user.dart';
import 'package:apptest_tog/core/ui/widgets/mycard.dart';
import 'package:apptest_tog/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'List User',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: kPrimary,
        focusColor: kBlack,
        child: const Icon(Icons.add),
        backgroundColor: kPrimary,
        onPressed: () async {
          await Get.to(() => const AddUser());
          homc.getUser();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _showTask(),
          ],
        ),
      ),

      // const SizedBox(
      //   height: 10,
      // ),
    );
  }

  _showTask() {
    return Expanded(
      child: Obx(
        () {
          return ListView.builder(
            itemCount: homc.userList.length,
            itemBuilder: (_, index) {
              // print(homc.userList.length);
              User user = homc.userList[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(_, user);
                          },
                          child: mycard(user),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            // style:
            //     isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, User user) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
              label: "Delete Task",
              onTap: () {
                homc.delete(user);
                homc.getUser();
                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
            ),
            _bottomSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              isClose: true,
              clr: Colors.red[300]!,
              context: context,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
