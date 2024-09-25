import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:store_app/services/home_model.dart';

List<Product> products = [];

Future<void> fetch() async {
  const url = "https://0f447d99267f2aabfbcde6065a78bc4f.serveo.net/api/item";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final resulte = body["data"] as List;

    products = resulte.map((item) => Product.fromJson(item)).toList();
      print(response.statusCode);
  } else {
    print(response.statusCode);
  }
}
