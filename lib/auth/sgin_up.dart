import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../dsign/clip_path.dart';
import '../dsign/sec_clippath.dart';
import 'sgin_in.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllerpassowrd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 246, 241, 241),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(builder: (context, constraints) {
            double responsiveHeight = constraints.maxHeight;
            double responsiveWidth = constraints.maxWidth;

            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(children: [
                    CustomPaint(
                      size: Size(responsiveWidth, responsiveHeight * 0.25),
                      painter: RPSCustomPainter(),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 40.0,
                        ),
                        child: ImageIcon(
                            AssetImage(
                                "images/adobe-creative-cloud-svgrepo-com.png"),
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 60),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: responsiveHeight * 0.5,
                    child: Column(
                      children: [
                        const Text(
                          " انشاء حساب",
                          style: TextStyle(fontSize: 25, fontFamily: 'arabic'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 10),
                          child: TextFormField(
                            controller: controllername,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'الاسم الكامل',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontFamily: 'arabic'),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 10),
                          child: TextFormField(
                            controller: controlleremail,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'البريد الالكتروني',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontFamily: 'arabic'),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: controllerphone,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'رقم الهاتف',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontFamily: 'arabic'),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 10),
                          child: TextFormField(
                            controller: controllerpassowrd,
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
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ElevatedButton(
                              onPressed: () {
                                signup(
                                    password: controllerpassowrd.text,
                                    email: controlleremail.text,
                                    fullName: controllername.text,
                                    phoneNumber: controllerphone.text);
                                setState(() {
                                  controlleremail.text = "";
                                  controllerpassowrd.text = "";
                                  controllername.text = "";
                                  controllerphone.text = "";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 81, 189, 195),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'انشاء حساب',
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
                              " لديك حساب بالفعل؟",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'arabic'),
                            ),
                            GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const Auth())),
                                child: const Text(
                                  " تسجيل الدخول ",
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
                      size: Size(responsiveWidth, responsiveHeight * 0.25),
                      painter: SecRPSCustomPainter(),
                    ),
                  ),
                ]);
          }),
        ));
  }

  void signup({
    required String password,
    required String email,
    required String fullName,
    required String phoneNumber,
  }) async {
    final url = Uri.parse(
        'http://e0ogc44k0k08g4wc0oss40ww.158.220.126.158.sslip.io/api/auth/register');

    final body = json.encode({
      "password": password,
      "email": email,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final route = MaterialPageRoute(builder: (context) => const Auth());
      // ignore: use_build_context_synchronously
      Navigator.push(context, route);
    } else {
      print('Signup failed: ${response.statusCode}');
    }
  }
}
