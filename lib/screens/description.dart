import 'package:flutter/material.dart';
import 'package:store_app/screens/base.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Base()));
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  const ImageIcon(
                    AssetImage("images/adobe-creative-cloud-svgrepo-com.png"),
                    size: 60,
                    color: Color.fromARGB(255, 81, 189, 195),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
              child: Image.asset(
                "images/pngegg_2.png",
                height: 300,
                width: 300,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                height: 332,
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 35.0, right: 8.0, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "سكجر رياضي",
                                style: TextStyle(
                                  fontFamily: "arabic",
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 71, 171, 176),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "(5)",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 40,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "الناشر : محمد حيدر",
                            style: TextStyle(
                                fontFamily: "arabic",
                                fontSize: 16,
                                color: Colors.black54),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " مريح وجيد اخخخخخخخخخخخخخ ",
                            style: TextStyle(
                                fontFamily: "arabic",
                                fontSize: 16,
                                color: Color.fromARGB(255, 13, 58, 51)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 76.0),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    size: 40,
                                  ),
                                  Text(
                                    "50,000 د",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "arabic",
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
