import 'package:flutter/material.dart';
import 'package:store_app/screens/base.dart';

class Notfaction extends StatefulWidget {
  const Notfaction({super.key});

  @override
  State<Notfaction> createState() => _NotfactionState();
}

class _NotfactionState extends State<Notfaction> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 247, 247, 247),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Base()));},
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color.fromARGB(230, 162, 162, 162),
              )),
          centerTitle: true,
          title: const Text(
            "الأشعارات",
            style: TextStyle(
              color: Color.fromARGB(255, 81, 189, 195),
              fontFamily: 'arabic',
              fontSize: 25,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                    top: index == 0 ? 25 : 15,
                    right: 15,
                    left: 15,
                    bottom: index == 9 ? 15 : 0),
                height: 67,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // لون الظل
                      spreadRadius: 0.5, // مدى انتشار الظل
                      blurRadius: 0.2, // مدى ضبابية الظل
                      offset: const Offset(0, 3), // موقع الظل (إزاحة)
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
