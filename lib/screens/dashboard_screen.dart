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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recents',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                height: 250,
                child: Flexible(
                  //fit: FlexFit.loose,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
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
                                borderRadius: BorderRadius.circular(20),
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
                height: 20,
              ),
              Divider(
                height: 5,
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Benjamin',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Step into the world of \nImmersive Car Visuals:\nCapture,Customize,\nand Showcase in 360°',
                style: TextStyle(fontSize: 18,color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'CREATE 3D MODEL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    
                  ),
                  decoration: BoxDecoration(
                   color: Color.fromARGB(241, 17, 1, 1),
                   borderRadius: BorderRadius.circular(20),
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
