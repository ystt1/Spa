import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/News.dart';

class NewsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<News>> getHighlighNews() async {
    List<News> newses = [];
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('News')
          .where("isHighlight", isEqualTo: true)
          .get();
      for (var doc in querySnapshot.docs) {
        News news = News.fromFirestore(doc);
        news.Favorite = await getFavorite(news);
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
      QuerySnapshot querySnapshot = await _firestore.collection('News').orderBy("pulishDate",descending: true).get();
      for (var doc in querySnapshot.docs) {
        News news = News.fromFirestore(doc);
        news.Favorite = await getFavorite(news);

        newses.add(news);
      }
      return newses;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return [];
  }

  Future<bool> getFavorite(News news) async {
    try {
      String? userId = _auth.currentUser?.uid;
      QuerySnapshot querySnapshot = await _firestore
          .collection('FavoritesNews')
          .where("IDNews", isEqualTo: news.id)
          .where('IDUser', isEqualTo: userId)
          .get();
      if (querySnapshot.docs.isNotEmpty) return true;
      return false;
    } catch (e) {
      print("Error fetching branches: $e");
    }
    return false;
  }

  Future<void> createFavoriteNews(News news) async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _firestore.collection("FavoritesNews").add({
          'IDNews': news.id,
          // Assuming you have a toMap() method in your News model
          'IDUser': userId,
        });
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
  }


  Future<void> deleteFavoriteNews(News news) async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('FavoritesNews')
            .where("IDNews", isEqualTo: news.id)
            .where('IDUser', isEqualTo: userId)
            .get();

        // Duyệt qua danh sách tài liệu và xóa từng tài liệu một
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          await documentSnapshot.reference.delete();
        }
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
  }


  Future<List<News>> getListFavoritesNews() async {
    List<News> newsList=[];
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('FavoritesNews')
            .where('IDUser', isEqualTo: userId)
            .get();

        // Duyệt qua danh sách tài liệu và xóa từng tài liệu một
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          final data = documentSnapshot.data() as Map<String, dynamic>;
          String idNews=data["IDNews"];
          News? news=await getFavoritesNewsWithId(idNews);
          if(news!=null)
            {
              news.Favorite=true;
              newsList.add(news);
            }

        }
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
    return newsList;
  }
  Future<News?> getFavoritesNewsWithId(String id ) async {
    try {
        QuerySnapshot querySnapshot = await _firestore
            .collection('News')
            .where('ID (PK)', isEqualTo: id)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot doc = querySnapshot.docs.first;
        return News.fromFirestore(doc);
      } else {
        print("User is not logged in");
      }
    } catch (e) {
      print("Error creating favorite news: $e");
    }
    return null;
  }

}
