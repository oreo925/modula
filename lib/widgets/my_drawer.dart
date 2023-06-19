import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _accountName = '';
  String _accountEmail = '';
  //String _userRole = '';
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _fetchUserDetails();
    }
  }

  Future<void> _fetchUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data()!;
        setState(() {
          _accountName = userData['username'];
          _accountEmail = userData['email'];
          // _userRole = userData['role'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_accountName),
              accountEmail: Text(_accountEmail),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  MdiIcons.accountCircle,
                  size: 70,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              },
              leading: Icon(Icons.home, color: IconTheme.of(context).color),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              },
              leading: Icon(Icons.person, color: IconTheme.of(context).color),
              title: Text('Profie'),
            ),
            ListTile(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              },
              leading: Icon(Icons.privacy_tip_outlined, color: IconTheme.of(context).color),
              title: Text('Privacy'),
            ),
            ListTile(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              },
              leading: Icon(MdiIcons.chartBoxOutline, color: IconTheme.of(context).color),
              title: Text('Terms & Conditions'),
            ),
            ListTile(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              },
              leading: Icon(Icons.logout_outlined, color: IconTheme.of(context).color),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
