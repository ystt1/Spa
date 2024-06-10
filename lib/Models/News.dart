import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String id;
  final String imageUrl;
  final String title;
  final String details;
  final DateTime postedTime;
  final bool isFeatured;
  late bool Favorite=false;

  News({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.details,
    required this.postedTime,
    required this.isFeatured,
  });

  factory News.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return News(
      id: data['ID (PK)'] ?? "", // Sử dụng giá trị mặc định nếu không có trường 'id'
      imageUrl: data['imageUrl'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'imageUrl'
      title: data['title'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'title'
      details: data['detail'] ?? '', // Sử dụng giá trị mặc định nếu không có trường 'details'
      postedTime: (data['pulishDate'] as Timestamp).toDate(), // Chuyển đổi Timestamp Firestore sang DateTime
      isFeatured: data['isHighlight'] ?? false, // Sử dụng giá trị mặc định nếu không có trường 'isFeatured'
    );
  }
}