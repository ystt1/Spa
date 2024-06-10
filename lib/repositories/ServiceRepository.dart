import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tbdd/Models/CategoryService.dart';
import 'package:tbdd/Models/Service.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Service>> getHighlighBranches() async {
    late List<Service> services = [];
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Service')
          .where('isHighlight', isEqualTo: true)
          .get();
      for (var doc in querySnapshot.docs) {
        Service service = Service.fromFirestore(doc);
        services.add(service);
      }
      ;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return services;
  }

  Future<List<CategoryService>> getAllCategory() async {
    late List<CategoryService> cates = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('CategoryService').get();
      for (var doc in querySnapshot.docs) {
        CategoryService categoryService = CategoryService.fromFirestore(doc);
        List<Service> services = await getListServicewithCate(categoryService);
        categoryService.services = services;
        cates.add(categoryService);
      }
      ;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return cates;
  }

  Future<List<Service>> getListServicewithCate(
      CategoryService categoryService) async {
    List<Service> services = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('Service').where("categoryID (FK)",isEqualTo: categoryService.id).get();
      for (var doc in querySnapshot.docs) {
        Service service = Service.fromFirestore(doc);
        services.add(service);
      }
      ;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return services;
  }


  Future<List<Service>> getServicesWithNameContaining(String search) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('services')
          .where('name', isGreaterThanOrEqualTo: search)
          .where('name', isLessThan: search + 'z')
          .get();

      return querySnapshot.docs
          .map((doc) => Service.fromFirestore(doc))
          .toList();
    } catch (e) {
      print("Error fetching services: $e");
      return [];
    }
  }

// Hàm để tìm danh sách các danh mục chứa các dịch vụ đã lấy
  Future<List<CategoryService>> findCategoriesContainingServices(
      String search) async {
    List<Service> services = await getServicesWithNameContaining(search);
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('categories')
          .where(
          'services', arrayContainsAny: services.map((s) => s.id).toList())
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryService.fromFirestore(doc))
          .toList();
    } catch (e) {
      print("Error fetching categories: $e");
      return [];
    }
  }
}
