// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:modula/screens/Auth/signin_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 5;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Get.off(SignIn());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          clipBehavior: Clip.none,
          height: 9.h,
          color: Colors.black,
          child: Row(
            children: [
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modula',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.5.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'By Disruptive AI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.5, 0.75],
                colors: [
                  Colors.black,
                  Color.fromARGB(255, 65, 3, 94),
                  Colors.black,
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/1.png'),
                      Positioned(
                          top: 3.5.h,
                          right: 7.w,
                          child: Image.asset('assets/2.png')),
                      Positioned(
                          top: 7.2.h,
                          right: 14.5.w,
                          child: Image.asset('assets/3.png')),
                      Positioned(
                          top: 7.3.h,
                          left: 1.w,
                          child: Image.asset('assets/4.png')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
