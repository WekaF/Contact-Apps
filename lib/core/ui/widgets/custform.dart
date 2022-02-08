import 'package:apptest_tog/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cust_textform extends StatelessWidget {
  final String label;
  final String? hint;
  final TextInputType? keytipe;
  final Widget? widget;
  final TextEditingController? controller;
  final TextInputFormatter? formatter;

   cust_textform(
      {Key? key, this.controller, this.hint, required this.label, this.widget, this.keytipe, this.formatter,  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: keytipe,
              enabled: true,
                controller: controller,
                readOnly: widget == null ? false : true,
                autofocus: false,
                decoration: InputDecoration(
                  label: Text(label),
                  hintText: hint,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kPrimary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                )),
          ),
          widget == null
              ? Container()
              : Container(
                  child: widget,
                ),
        ],
      ),
    );
  }
}
