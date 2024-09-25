import 'package:flutter/material.dart';
import 'dart:async';

import 'package:store_app/auth/sgin_in.dart'; // تأكد من صحة المسار
import '../dsign/clip_path.dart'; // تأكد من أن ملفات التصميم موجودة
import '../dsign/sec_clippath.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _iconPosition = -1; // بدءًا من خارج الشاشة على اليمين

  @override
  void initState() {
    super.initState();

    // تأخير بسيط ثم بدء الحركة للأيقونة
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _iconPosition = 0.0; // تحريك الأيقونة إلى الوسط
      });
    });

    // الانتقال إلى الشاشة الرئيسية بعد التأخير
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Auth()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // حساب أبعاد الشاشة بناءً على MediaQuery
    double responsiveWidth = MediaQuery.of(context).size.width;
    double responsiveHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // الشكل العلوي - يبدأ من الزاوية اليمنى العلوية ثم يتحرك إلى موضعه
          TweenAnimationBuilder(
            tween: Tween<Alignment>(
              begin: const Alignment(1.0, -2.0), // بدء من الزاوية العلوية اليمنى
              end: const Alignment(0.0, -1.0), // يستقر في الوسط العلوي
            ),
            duration: const Duration(milliseconds: 600), // مدة الحركة
            builder: (context, value, child) {
              return Align(
                alignment: value, // تحريك الشكل بناءً على القيمة المتحركة
                child: CustomPaint(
                  size: Size(responsiveWidth, responsiveHeight * 0.3),
                  painter: RPSCustomPainter(),
                ),
              );
            },
          ),
          // الأيقونة - تبدأ من خارج الشاشة إلى المركز
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: _iconPosition, end: 0.0),
              duration: const Duration(milliseconds: 600), // مدة الحركة
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment(
                      value, 0.0), // تحريك الأيقونة من الخارج إلى الوسط
                  child: Image.asset(
                    'images/adobe-creative-cloud-svgrepo-com.png', // تأكد من صحة مسار الصورة
                    width: 200,
                    height: 200,
                  ),
                );
              },
            ),
          ),
          // الشكل السفلي - يبدأ من الزاوية اليسرى السفلية ويصعد إلى موضعه
          TweenAnimationBuilder(
            tween: Tween<Alignment>(
              begin: const Alignment(-1.0, 2.0), // بدء من الزاوية السفلية اليسرى
              end: const Alignment(0.0, 1.0), // يستقر في المنتصف السفلي
            ),
            duration: const Duration(milliseconds: 600), // مدة الحركة
            builder: (context, value, child) {
              return Align(
                alignment: value, // تحريك الشكل بناءً على القيمة المتحركة
                child: CustomPaint(
                  size: Size(responsiveWidth, responsiveHeight * 0.3),
                  painter: SecRPSCustomPainter(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
