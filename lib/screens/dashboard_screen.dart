import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modula/widgets/my_drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  List imagePath = [
    'assets/car1.jpg',
    'assets/car2.jpeg',
    'assets/car3.jpeg',
    'assets/car4.jpeg',
    'assets/car5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      // width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.04, 0.18, 0.5],
          colors: [
            Colors.black,
            Color.fromARGB(255, 65, 3, 94),
            Colors.black,
          ],
        ),
      ),
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          //leading: Icon(MdiIcons.dotsGrid),
          backgroundColor: Colors.transparent,
          title: Text('Main'),
          centerTitle: true,
          actions: [
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recents',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 35.h,
                child: Flexible(
                  //fit: FlexFit.loose,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.sp),
                      bottomRight: Radius.circular(25.sp),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Swiper(
                          itemWidth:
                              450, // Increase the itemWidth to add larger gaps
                          itemHeight: 250, // Adjust this value as needed
                          loop: true,
                          indicatorLayout: PageIndicatorLayout.SCALE,
                          duration: 1200,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imagePath[index]),
                                ),
                                borderRadius: BorderRadius.circular(20.sp),
                                border: Border.all(color: Colors.black)
                              ),
                            );
                          },
                          itemCount: imagePath.length,
                          layout: SwiperLayout.TINDER,
                          viewportFraction: 0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Divider(
                height: 3.h,
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Benjamin',
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Step into the world of \nImmersive Car Visuals:\nCapture,Customize,\nand Showcase in 360°',
                style: TextStyle(fontSize: 17.sp,color: Colors.grey),
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  child: Text(
                    'CREATE 3D MODEL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    
                  ),
                  decoration: BoxDecoration(
                   color: Color.fromARGB(241, 17, 1, 1),
                   borderRadius: BorderRadius.circular(25.sp),
                   border: Border.all(color: const Color.fromARGB(255, 87, 21, 98),width: 1.5)
                  ),
                ),
              ),
              
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(items: [
          
        // ]),
      ),
    );
  }
}
