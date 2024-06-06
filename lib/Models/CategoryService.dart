import 'package:tbdd/Models/Service.dart';

class CategoryService {
  final String id;
  final String name;
  final List<Service> services;

  CategoryService({
    required this.id,
    required this.name,
    required this.services,
  });

  factory CategoryService.fromJson(Map<String, dynamic> json) {
    var serviceList = json['services'] as List;
    List<Service> services = serviceList.map((i) => Service.fromJson(i)).toList();

    return CategoryService(
      id: json['id'],
      name: json['name'],
      services: services,
    );
  }
}