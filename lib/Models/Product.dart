import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String urlImage;
  String name;
  String price;
  String details;
  String brand;

  Product({
    required this.id,
    required this.urlImage,
    required this.name,
    required this.price,
    required this.details,
    required this.brand,
  });


  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: data['ID (PK)'] ?? "", // Sử dụng giá trị mặc định nếu không có trường 'id'
      urlImage: data['urlImage'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'imageUrl'
      name: data['name'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'title'
      price: data['price'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'details'
      details: data['detail'] ??'', // Chuyển đổi Timestamp Firestore sang DateTime
      brand: data['brand'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'isFeatured'
    );
  }
}


