import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String id;
  final String name;
  final String idbranch;
  final String image;

  Employee(
      {required this.id,
      required this.name,
      required this.idbranch,
      required this.image});

  factory Employee.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Employee(
      id: data['id'] ?? "",
      name: data['name'] ??
          '', 
      idbranch: data['id-branch'] ??
          '', 
      image: data['image'] ??
          '', 
    );
  }
}
