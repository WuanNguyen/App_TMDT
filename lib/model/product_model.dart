import 'package:firebase_database/firebase_database.dart';

class Product{
  final String name;
  final String category;
  final String desc;
  final int price;

  Product({
    required this.name,
    required this.category,
    required this.desc,
    required this.price,
  });

  factory Product.fromRTDB(Map<String,dynamic> data){
    return Product(
      name: data['name'],
      category: data['category'],
      desc: data['desc'],
      price: data['price'] as int
    );
  }
}