import 'package:flutter/material.dart';
import 'package:store_app/screens/fav.dart';
import 'package:store_app/screens/profile.dart';
// تأكد من استيراد المكتبة

import '../dsign/nav_shape.dart';
import 'cart.dart';
import 'home.dart'; // تأكد من وجود هذا المسار والملف

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Nav Bar V2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNavBarV2(),
    );
  }
}

class BottomNavBarV2 extends StatefulWidget {
  const BottomNavBarV2({super.key});

  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  // قائمة الشاشات المختلفة
  final List<Widget> screens = [
    const Home(), // الشاشة الرئيسية
    const Fav(), // صفحة الإشعارات
    const Reqlist(),
    const Profile()
  ];

  void setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index; // تحديث الفهرس
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255).withAlpha(55),
      body: Stack(
        children: [
          // عرض الشاشة الحالية بناءً على الـ currentIndex
          screens[currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      shape: const CircleBorder(eccentricity: 1.0),
                      backgroundColor: const Color.fromARGB(255, 15, 67, 58),
                      elevation: 1,
                      onPressed: () {},
                      child: const Icon(
                        Icons.add_shopping_cart_sharp,
                        color: Color.fromARGB(255, 81, 189, 195),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: currentIndex == 0 ? 30 : 25,
                            color: currentIndex == 0
                                ? const Color.fromARGB(255, 81, 189, 195)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(
                                0); // تعيين الفهرس للشاشة الرئيسية
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: currentIndex == 1 ? 30 : 25,
                            color: currentIndex == 1
                                ? const Color.fromARGB(255, 81, 189, 195)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1); // تعيين الفهرس لقائمة الطعام
                          },
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.list_alt_rounded,
                            size: currentIndex == 2 ? 30 : 25,
                            color: currentIndex == 2
                                ? const Color.fromARGB(255, 81, 189, 195)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2); // تعيين الفهرس للعلامات
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            size: currentIndex == 3 ? 30 : 25,
                            color: currentIndex == 3
                                ? const Color.fromARGB(255, 81, 189, 195)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3); // تعيين الفهرس للإشعارات
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
