import 'dart:async';

import 'package:apptest_tog/core/controllers/addc.dart';
import 'package:apptest_tog/core/models/user.dart';
import 'package:apptest_tog/core/ui/homepage.dart';
import 'package:apptest_tog/core/ui/widgets/custform.dart';
import 'package:apptest_tog/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final addc = Get.put(AddController());

  bool btndisable = false;

    final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';



  void startTimeout([int? seconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    Future.delayed(const Duration(seconds: 60), () {
      if (mounted) {
        setState(() {
          btndisable = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        // leading: const Icon(Icons.arrow_back, ),
        title: const Text(
          'Add User',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              GetBuilder<AddController>(
                init: AddController(),
                initState: (_) {},
                builder: (_) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                            child: addc.image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      addc.image!,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 120,
                                    height: 120,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    cust_textform(
                      controller: addc.namaC,
                      label: 'Nama',
                      hint: 'masukkan nama',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    cust_textform(
                      controller: addc.alamat,
                      label: 'alamat',
                      hint: 'masukkan alamat',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    cust_textform(
                      label: DateFormat.yMd().format(addc.tanggal),
                      hint: DateFormat.yMd().format(addc.tanggal),
                      widget: IconButton(
                        onPressed: () {
                          _getDateFromUser();
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          color: kBlack,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: cust_textform(
                            formatter: FilteringTextInputFormatter.digitsOnly,
                            keytipe: const TextInputType.numberWithOptions(
                                signed: true),
                            controller: addc.berat,
                            label: 'Berat',
                            hint: 'masukkan Berat badan',
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(child: Text('Kg')),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: cust_textform(
                            keytipe: TextInputType.number,
                            controller: addc.tinggi,
                            label: 'Tinggi',
                            hint: 'masukkan tinggi badan',
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(child: Text('Cm')),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 1,
                            child: RaisedButton(
                              disabledColor: Colors.grey[200],
                              disabledTextColor: kPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: kPrimary)),
                              onPressed: btndisable
                                  ? null
                                  : () async{
                                    await _validateData();
                                  },
                              color: kPrimary,
                              textColor: kBlack,
                              child: Text("submit".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(timerText),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateData()  {
    if (addc.namaC.text.isNotEmpty &&
        addc.alamat.text.isNotEmpty &&
        addc.berat.text.isNotEmpty &&
        addc.tinggi.text.isNotEmpty) {
      _addTaskToDb();
      addc.refresh();
      // Get.to(() => HomePage());
      Get.back();
    } else if (addc.namaC.text.isEmpty ||
        addc.alamat.text.isEmpty ||
        addc.tinggi.text.isEmpty ||
        addc.berat.text.isEmpty ||
        addc.tinggi.text.isEmpty) {
      Get.snackbar("Peringatan", "Semua Data Harus Diisi!.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

   _addTaskToDb() async {
    int? value = await addc.addTask(
      user: User(
          nama: addc.namaC.text,
          alamat: addc.alamat.text,
          tanggal: DateFormat.yMd().format(addc.tanggal),
          tinggi: addc.tinggi.text,
          berat: addc.berat.text,
          foto: addc.imagePath),
    );
    print("My id is" + "$value");
  }

   _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: GetBuilder<AddController>(
              init: AddController(),
              builder: (context) {
                return Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                          leading: const Icon(Icons.photo_library),
                          title: const Text('Photo Library'),
                          onTap: () {
                            addc.getImage();
                            Get.back();
                            // Navigator.of(context).pop();
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      if (mounted) {
        setState(() {
          addc.tanggal = _pickerDate;
        });
      } else {
        print("It's null or something is wrong.");
      }
    }
  }
}
