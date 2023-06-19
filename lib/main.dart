// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modula/screens/dashboard_screen.dart';
import 'package:modula/screens/SplashScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
          drawerTheme: DrawerThemeData(
            backgroundColor: Color(0xFF471B5B),
            //scrimColor: Color(0xFF471B5B)

          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
