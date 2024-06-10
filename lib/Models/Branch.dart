import 'package:cloud_firestore/cloud_firestore.dart';

class Branch {
  late String id;
  late String imageUrl;
  late String name;
  late String address;
  late String openingHours;
  late String phoneNumber;

  Branch({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.openingHours,
    required this.phoneNumber,
  });


  factory Branch.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Branch(
      id: data['ID (PK)'] ?? ' ',
      imageUrl: data['imageUrl'] ?? '',
      name: data['name'] ?? '',
      address: data['address'] ?? data['address '],
      openingHours: data['openingHours'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }
}




