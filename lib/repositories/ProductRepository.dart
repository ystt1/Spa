import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tbdd/Models/Product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Product>> getAllProduct() async {
    late List<Product> products = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('Product').get();
      for (var doc in querySnapshot.docs) {
        Product product = Product.fromFirestore(doc);
        products.add(product);
      }
      ;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return products;
  }

}
