// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modula/screens/Auth/signin_screen.dart';
import 'package:modula/utils/utils.dart';
import 'package:modula/widgets/my_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPasswordController = TextEditingController();
  final mobileNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        clipBehavior: Clip.none,
        height: 10.h,
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
                  style: GoogleFonts.poppins(
                    fontSize: 17.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'By Disruptive AI',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
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
                stops: [0.05, 0.2, 0.5],
                colors: [
                  Colors.black,
                  Color.fromARGB(255, 65, 3, 94),
                  Colors.black,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(11.w, 6.5.h, 11.w, 0.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Image.asset('assets/Group a.png'),
                          Positioned(
                              top: 2.2.h,
                              right: 4.3.w,
                              child: Image.asset('assets/Group b.png')),
                          Positioned(
                              top: 4.5.h,
                              right: 9.w,
                              child: Image.asset('assets/Group c.png')),
                          Positioned(
                              top: 3.5.h,
                              right: 1.5.w,
                              child: Image.asset('assets/mercc.png')),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    GradientText(
                      'Sign Up',
                      style: GoogleFonts.inter(
                        fontSize: 19.5.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                      colors: [
                        Color(0xff924FFF),
                        Color(0xffD61672),
                        Color(0xffF442B5),
                        Color(0xff899CFF),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        MyTextField(
                          labelText: 'Email',
                          containerWidth: 38.w,
                          controller: emailController,
                        ),
                        SizedBox(width: 2.w),
                        MyTextField(
                          labelText: 'Username',
                          containerWidth: 38.w,
                          controller: userNameController,
                        )
                      ],
                    ),
                    SizedBox(height: 1.3.h),
                    MyTextField(
                      labelText: 'Password',
                      obscureText: true,
                      suffixIcon: Image.asset('assets/eye.png'),
                      controller: passwordController,
                    ),
                    SizedBox(height: 1.3.h),
                    MyTextField(
                      labelText: 'Confirm Password',
                      obscureText: true,
                      suffixIcon: Image.asset('assets/eye.png'),
                      controller: cnfPasswordController,
                    ),
                    SizedBox(height: 1.3.h),
                    MyTextField(
                      labelText: 'Mobile Number',
                      controller: mobileNoController,
                    ),
                    SizedBox(height: 1.3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'or Sign In with',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 3.3.h,
                          child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              minWidth: 5.w,
                              onPressed: () {},
                              child: Image.asset('assets/G.png')),
                        )
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 14.5.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 1.5.w),
                        MaterialButton(
                            padding: EdgeInsets.all(0),
                            minWidth: 5.w,
                            onPressed: () {
                              Get.to(SignIn());
                            },
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontSize: 14.5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            if (passwordController.text ==
                                cnfPasswordController.text) {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) async {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(value.user!.uid)
                                      .set({
                                    'email': emailController.text.toString(),
                                    'username':
                                        userNameController.text.toString(),
                                    'mobileNo':
                                        mobileNoController.text.toString()
                                  }).then((value) {
                                    Utils().showToast('SignUp Sucessfully');
                                  });
                                } catch (e) {
                                  Utils().showToast(e.toString());
                                }
                              });
                            } else {
                              Utils().showToast('Password Not Matched');
                            }
                          } on FirebaseAuthException catch (e) {
                            Utils().showToast(e.toString());
                          }
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 62.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff41035E),
                              borderRadius: BorderRadius.circular(33.sp)),
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
