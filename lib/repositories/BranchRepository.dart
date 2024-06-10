

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../Models/Branch.dart';

class BranchRepository{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Branch>> getBranches() async {
    late List<Branch> branches = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Branch').get();
      for (var doc in querySnapshot.docs) {
        Branch branch = Branch.fromFirestore(doc);
        branch.openingHours = await getOpeningHourForDay(branch.id) ?? "";
        branches.add(branch);

      };
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return branches;
  }

  Future<List<Branch>> getOtherBranches( Branch branch) async {
    late List<Branch> branches = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Branch').where("ID (PK)",isNotEqualTo: branch.id).get();
      for (var doc in querySnapshot.docs) {
        Branch branch = Branch.fromFirestore(doc);
        branch.openingHours = await getOpeningHourForDay(branch.id) ?? "";
        branches.add(branch);

      };
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return branches;
  }


  Future<String?> getOpeningHourForDay(String id) async {
    var date = DateTime.now();
    var day=DateFormat('EEEE').format(date);
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('OpeningHour').where('branchID', isEqualTo: id).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        return doc.get(day.toLowerCase());
      }
    } catch (e) {
      print("Error fetching opening hour for $id: $e");
    }
    return null;
  }





}