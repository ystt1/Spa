import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:tbdd/Models/Product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<Product>> getAllProduct() async {
    late List<Product> products = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('Product').get();
      for (var doc in querySnapshot.docs) {
        Product product = Product.fromFirestore(doc);
        product.Favorite=await getFavorite(product);
        products.add(product);
      }
      ;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return products;
  }

  Future<bool> getFavorite(Product product) async {
    try {
      String? userId = _auth.currentUser?.uid;
      QuerySnapshot querySnapshot = await _firestore
          .collection('ProductFavorite')
          .where("IDProduct", isEqualTo: product.id)
          .where('IDUser', isEqualTo: userId)
          .get();
      if (querySnapshot.docs.isNotEmpty) return true;
      return false;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return false;
  }



  Future<void> createFavoriteProducts(Product product) async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _firestore.collection("ProductFavorite").add({
          'IDProduct': product.id,
          // Assuming you have a toMap() method in your News model
          'IDUser': userId,
        });
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
  }


  Future<void> deleteFavoriteProduct(Product product) async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('ProductFavorite')
            .where("IDProduct", isEqualTo: product.id)
            .where('IDUser', isEqualTo: userId)
            .get();

        // Duyệt qua danh sách tài liệu và xóa từng tài liệu một
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          await documentSnapshot.reference.delete();
        }
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
  }


  Future<List<Product>> getListFavoritesProducts() async {
    List<Product> listProduct=[];
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('ProductFavorite')
            .where('IDUser', isEqualTo: userId)
            .get();

        // Duyệt qua danh sách tài liệu và xóa từng tài liệu một
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          final data = documentSnapshot.data() as Map<String, dynamic>;
          String id=data["IDProduct"];
          Product? product=await getFavoritesProductwithID(id);
          if(product!=null)
          {
            product.Favorite=true;
            listProduct.add(product);
          }

        }
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
    return listProduct;
  }
  Future<Product?> getFavoritesProductwithID(String id ) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('ProductFavorite')
          .where('ID (PK)', isEqualTo: id)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        return Product.fromFirestore(doc);
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
    return null;
  }

}
