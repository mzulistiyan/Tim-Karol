import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';

class TextFielCustom extends StatelessWidget {
  final String hintText;
  final IconData iconTextField;
  final TextEditingController controller;
  final bool obsecure;
  const TextFielCustom(
      {required this.hintText,
      required this.iconTextField,
      required this.controller,
      this.obsecure = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(top: 10), // add padding to adjust text
          isDense: true,
          hintText: hintText,
          hintStyle: Global.regulerTextStyle12
              .copyWith(color: const Color(0xffB4B4B4)),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
            child: Icon(
              iconTextField,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
