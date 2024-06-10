import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final String id;
  final String imgUrl;
  final String name;
  final String duration;
  final String detail;
  final bool isHighlight;
  final int price;
  final String categoryId;

  Service({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.duration,
    required this.detail,
    required this.isHighlight,
    required this.price,
    required this.categoryId,
  });

  factory Service.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Service(
      id: data['ID (PK)'] ?? '',
      imgUrl: data['imageUrl'] ?? '',
      name: data['name'] ?? '',
      duration: data['duration'] ?? '',
      detail: data['detail'] ?? '',
      isHighlight: data['isHighlight'] ?? '',
      price: data['price'] ?? '',
      categoryId: data['categoryID (FK)'] ?? '',
    );
  }


}