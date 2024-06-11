import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tbdd/Models/Employee.dart';

class EmployeeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('Employee').get();
      employees =
          querySnapshot.docs.map((doc) => Employee.fromFirestore(doc)).toList();
      print(employees);
      return employees;
    } catch (e) {
      print("Error fetching employees: $e");
      return [];
    }
  }
}
