import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/Models/Employee.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/Models/Order.dart';

class BookingRepository {
  Future<void> addOrder(order Order) async {
    try {
      final firestore = FirebaseFirestore.instance;

      DocumentReference docRef = await firestore.collection('orders').add({
        "timeStart": Order.timeStart,
        "timeDate": Order.timeDate,
        "idEmployee": Order.idemployee,
        "idBranch": Order.idBranch,
        "Serviceid": Order.idservice
      });

      print("Order added with ID: ${docRef.id}");
    } catch (e) {
      print("Error adding order: $e");
    }
  }
}
