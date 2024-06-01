
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_app.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.icon,
    required this.hintText,
    required this.textEditingController,
  });
  Widget icon;
  String hintText;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: icon,

        hintText: hintText,
        hintStyle: TextStyle(
            color: primary, fontSize: 15, fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: primary,
          ),
        ),
      ),
    );
  }
}
