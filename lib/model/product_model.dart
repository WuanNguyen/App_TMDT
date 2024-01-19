import 'package:firebase_database/firebase_database.dart';

class Product{
  final String name;
  final String category;
  final String desc;
  int price;

  Product({
    required this.name,
    required this.category,
    required this.desc,
    required this.price,
  });

  factory Product.fromSnapshot(DataSnapshot snapshot){
    return Product(
      name: snapshot.child('name').value.toString(), 
      category: snapshot.child('category').value.toString(), 
      desc: snapshot.child('desc').value.toString(), 
      price: int.parse(snapshot.child('price').value.toString())
    );
  }
  toJson(){}
}