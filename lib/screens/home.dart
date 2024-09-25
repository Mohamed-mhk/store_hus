import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/home_model.dart';
import 'description.dart';
import 'notfaction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchCont = TextEditingController();
  int selectedcolor = 0;
  int rating = 5;
  List<Product> products = [];
  bool notf = false;
  @override
  void initState() {
    fetch(); // استدعاء جلب البيانات عند البدء
    super.initState();
  }

  @override
  void dispose() {
    searchCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                notf = false;
              });
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color.fromARGB(255, 247, 247, 247),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                      AssetImage(
                                          "images/adobe-creative-cloud-svgrepo-com.png"),
                                      color: Color.fromARGB(255, 81, 189, 195),
                                      size: 80),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        notf = !notf;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.notifications_none_rounded,
                                      size: 35,
                                      weight: 30,
                                      color: Color.fromARGB(255, 81, 189, 195),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      controller: searchCont,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "بحث",
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'arabic'),
                                        suffixIcon: const Icon(
                                          Icons.search,
                                          color:
                                              Color.fromARGB(255, 81, 189, 195),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 81, 189, 195),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "منتجاتنا",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'arabic'),
                            ),
                            SizedBox(
                              height: 63, // Height of horizontal ListView
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedcolor = index;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 4.5),
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: selectedcolor == index
                                            ? const Color.fromARGB(
                                                255, 81, 189, 195)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "احذيه",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: selectedcolor == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily: 'arabic'),
                                            ),
                                          ),
                                          Image.asset(
                                            'images/icons8-shoes-64.png',
                                            width: 40,
                                            height: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      products.isNotEmpty
                          ? SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  final product = products[index];
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Description()),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              "https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D",
                                              height: 200,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              product.title,
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 81, 189, 195),
                                                fontFamily: 'arabic',
                                                fontSize: 18,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                product.description,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 81, 189, 195),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children:
                                                  List.generate(5, (starIndex) {
                                                return Icon(
                                                  Icons.star,
                                                  color: rating > starIndex
                                                      ? Colors.amber
                                                      : Colors.grey,
                                                );
                                              }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount: products.length,
                              ),
                            )
                          : const SliverToBoxAdapter(
                              child: Center(
                                child: Text(
                                  'لا توجد منتجات متاحة',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              ),
                            ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (notf) // Use a conditional statement to display contclas
            const Positioned(
              top: 80,
              right: 15,
              child: Contclas(), // Display the notification container
            ),
        ],
      ),
    );
  }

  Future<void> fetch() async {
    const url = "https://0f447d99267f2aabfbcde6065a78bc4f.serveo.net/api/item";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final results = body["data"] as List;
      setState(() {
        products = results.map((item) => Product.fromJson(item)).toList();
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}

class Contclas extends StatelessWidget {
  const Contclas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 480,
        width: 320,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // لون الظل
              spreadRadius: 2, // مدى انتشار الظل
              blurRadius: 5, // مدى ضبابية الظل
              offset: const Offset(0, 3), // موقع الظل (إزاحة)
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 20),
              child: Text(
                'الأشعارات',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 81, 189, 195),
                    fontFamily: 'arabic'),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: index == 0 ? 3 : 15, right: 15, left: 15),
                    height: 60,
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
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notfaction()));
                },
                child: const Text(
                  'عرض المزيد',
                  style: TextStyle(
                      fontFamily: 'arabic',
                      fontSize: 18,
                      color: Color.fromARGB(230, 162, 162, 162)),
                ),
              ),
            )
          ],
        ));
  }
}
