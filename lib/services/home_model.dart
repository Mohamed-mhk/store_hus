class Product {
  final String title;
  final String mainImg;
  final String description;
 // final String publisherName;
  //final int rating;
   
  Product({
    required this.title,
    required this.mainImg,
    required this.description,
    //required this.publisherName,
    //required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json["title"],
        mainImg: json["mainImg"],
        description: json["description"],
       // publisherName: json["publisherName"],
     //   rating: json["rating"]);
 ); }
}
