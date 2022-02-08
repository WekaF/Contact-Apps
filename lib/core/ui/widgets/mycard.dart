import 'dart:io';

import 'package:apptest_tog/core/controllers/addc.dart';
import 'package:apptest_tog/core/models/user.dart';
import 'package:apptest_tog/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class mycard extends StatelessWidget {

  final User? user;
  mycard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width / 1.1,
      height: 160,
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                child: user?.foto != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          File(user!.foto!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 12, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.nama ?? "",
                  style: NameStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user?.alamat ?? "",
                  style: alamatStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Tanggal Lahir : ${user?.tanggal} ", style: tanggalStyle,),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('TB : ${user?.tinggi ?? ""}', style: tbttStyle,),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('BB : ${user?.berat}', style: tbttStyle,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
