import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../dsign/clip_path.dart';
import '../dsign/sec_clippath.dart';
import '../screens/home.dart';

import 'sgin_up.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();

  @override
  void dispose() {
    controlleremail.dispose();
    controllerpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const ui.Color.fromARGB(255, 241, 246, 246),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double responsiveHeight = constraints.maxHeight;
            double responsiveWidth = constraints.maxWidth;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  CustomPaint(
                    size: Size(
                      responsiveWidth,
                      responsiveHeight * 0.3,
                    ),
                    painter: RPSCustomPainter(),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: ImageIcon(
                          AssetImage(
                              "images/adobe-creative-cloud-svgrepo-com.png"),
                          color: ui.Color.fromARGB(255, 255, 255, 255),
                          size: 60),
                    ),
                  )
                ]),
                SizedBox(
                  height: responsiveHeight * 0.4,
                  child: Column(
                    children: [
                      const Text(
                        "تسجيل الدخول",
                        style: TextStyle(fontSize: 25, fontFamily: 'arabic'),
                      ),
                      SizedBox(height: responsiveHeight * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth * 0.05,
                            vertical: responsiveHeight * 0.01),
                        child: TextFormField(
                          controller: controlleremail,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'البريد الالكتروني ',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'arabic'),
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth * 0.05,
                            vertical: responsiveHeight * 0.01),
                        child: TextFormField(
                          controller: controllerpassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'كلمة المرور',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontFamily: 'arabic'),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: responsiveHeight * 0.01),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: responsiveHeight * 0.03),
                        child: ElevatedButton(
                            onPressed: () {
                              login(
                                  email: controlleremail.text,
                                  password: controllerpassword.text);
                              setState(() {
                                controlleremail.text = "";
                                controllerpassword.text = "";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 81, 189, 195),
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth * 0.1,
                                  vertical: responsiveHeight * 0.015),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'arabic'),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ليس لديك حساب؟",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'arabic'),
                          ),
                          const Text(" "),
                          GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => const Signup())),
                              child: const Text(
                                "انشاء حساب ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'arabic',
                                    color: Color.fromARGB(255, 81, 189, 195)),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomPaint(
                    size: Size(
                      responsiveWidth,
                      responsiveHeight * 0.3,
                    ),
                    painter: SecRPSCustomPainter(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void login({required String email, required String password}) async {
    final url = Uri.parse(
        'http://e0ogc44k0k08g4wc0oss40ww.158.220.126.158.sslip.io/api/auth/login');

    // تحويل البيانات إلى JSON
    final body = json.encode({
      "email": email,
      "password": password,
    });

    // إرسال الطلب بتنسيق JSON
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      // في حال نجاح تسجيل الدخول
      final route = MaterialPageRoute(builder: (context) => const Home());
      Navigator.push(context, route);
    } else {
      // في حال فشل تسجيل الدخول
      print('Login failed: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل تسجيل الدخول، تحقق من البيانات.')),
      );
    }
  }
}
