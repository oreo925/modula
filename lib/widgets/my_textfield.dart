import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class MyTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final double? containerWidth;
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  const MyTextField(
      {super.key,
      required this.labelText,
      this.controller,
      this.containerWidth,
      this.suffixIcon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: containerWidth,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        style: TextStyle(
          color: Color.fromARGB(194, 255, 255, 255),
          letterSpacing: 0.2,
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color.fromARGB(194, 255, 255, 255),
            letterSpacing: 0.2,
            fontSize: 15.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
          ),
          filled: true,
          fillColor: Color.fromARGB(59, 255, 255, 255),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
