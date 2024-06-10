

import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/News.dart';

class NewsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<News>> getHighlighNews() async {
    List<News> newses = [];
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('News')
          .where("isHighlight", isEqualTo: true)
          .get();
      for (var doc in querySnapshot.docs) {

        News news = News.fromFirestore(doc);

        newses.add(news);
      }
      return newses;

    } catch (e) {
      print("Error fetching branches: $e");
    }
    return [];
  }


  Future<List<News>> getAllNews() async {
    List<News> newses = [];
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('News')
          .get();
      for (var doc in querySnapshot.docs) {

        News news = News.fromFirestore(doc);

        newses.add(news);
      }
      return newses;

    } catch (e) {
      print("Error fetching branches: $e");
    }
    return [];
  }
}
