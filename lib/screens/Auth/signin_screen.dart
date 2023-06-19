// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modula/screens/dashboard_screen.dart';
import 'package:modula/utils/utils.dart';
import 'package:modula/widgets/my_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'signup_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
              stops: [0.1, 0.25, 0.6],
              colors: [
                Colors.black,
                Color.fromARGB(255, 65, 3, 94),
                Colors.black,
              ],
            )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 0.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Image.asset('assets/Group 2.png'),
                          Positioned(
                              top: 2.4.h,
                              right: 4.7.w,
                              child: Image.asset('assets/Group 3.png')),
                          Positioned(
                              top: 5.h,
                              right: 9.7.w,
                              child: Image.asset('assets/Group 4.png')),
                          Positioned(
                              top: 4.2.h,
                              right: 2.6.w,
                              child: Image.asset('assets/merc.png')),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),
                    GradientText(
                      'Let’s sign you in',
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
                    SizedBox(height: 3.h),
                    MyTextField(
                      labelText: 'Email or username',
                      controller: emailController,
                    ),
                    SizedBox(height: 1.5.h),
                    MyTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      suffixIcon: Image.asset('assets/eye.png'),
                      obscureText: true,
                    ),
                    SizedBox(height: 0.2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'or Sign In with',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MaterialButton(
                            height: 3.h,
                            padding: EdgeInsets.all(0),
                            minWidth: 5.w,
                            onPressed: () async {
                              try {
                                await signInWithGoogle();
                                //await googleSignIn.signIn();
                              } catch (e) {
                                Utils().showToast(e.toString());
                              }
                            },
                            child: Image.asset('assets/G.png'))
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
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
                              Get.to(SignUp());
                            },
                            child: Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontSize: 14.5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardScreen(),
                                ),
                                (route) => false);
                          });
                        } catch (e) {
                          Utils().showToast(e.toString());
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 6.h,
                          width: 67.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff41035E),
                              borderRadius: BorderRadius.circular(33.sp)),
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                              fontSize: 16.sp,
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
