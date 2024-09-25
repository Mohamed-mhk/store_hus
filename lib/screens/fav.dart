import 'package:flutter/material.dart';
import 'description.dart';

class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _ProfileState();
}

class _ProfileState extends State<Fav> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
            centerTitle: true,
            title: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemCount: 8, // Number of grid items
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Description()),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/pngegg_2.png",
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "shoes",
                              style: TextStyle(
                                color: Color.fromARGB(255, 81, 189, 195),
                                fontFamily: 'arabic',
                                fontSize: 18,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                '50.000',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 81, 189, 195),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color:
                                      rating >= 1 ? Colors.amber : Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  color:
                                      rating >= 2 ? Colors.amber : Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  color:
                                      rating >= 3 ? Colors.amber : Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  color:
                                      rating >= 4 ? Colors.amber : Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  color:
                                      rating >= 5 ? Colors.amber : Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
