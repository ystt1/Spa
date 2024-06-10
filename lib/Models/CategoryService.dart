import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tbdd/Models/Service.dart';

class CategoryService {
  final String id;
  final String name;
  late List<Service> services;

  CategoryService({
    required this.id,
    required this.name,
    required this.services,
  });
  factory CategoryService.fromFirestore(DocumentSnapshot doc) {
    // Lấy dữ liệu từ DocumentSnapshot và tạo đối tượng CategoryService
    final data = doc.data() as Map<String, dynamic>;
    final id = data['ID (PK)']??'';
    final name = data['name'] ?? '';
    final List<Service> services = [];

    return CategoryService(
      id: id,
      name: name,
      services: services,
    );
  }

}