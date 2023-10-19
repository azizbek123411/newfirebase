import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newfirebase/services/usermodel.dart';

class DatabaseServices {
  String collectionName = 'football';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///Add
  Future<void> add(Futbol footBall) async {
    final collection = firestore.collection(collectionName);
    await collection.add(footBall.toJson());
  }

  ///Get
  Future<List<Futbol>> get() async {
    List<Futbol> futbol = [];

    final collection = firestore.collection(collectionName);
    final result = await collection.get();
    for (final item in result.docs) {
      try {
        Futbol footBall = Futbol.fromJson(item.data());
        footBall.id = item.id;
        futbol.add(footBall);
        log("$futbol");
      } catch (error) {
        log("$error");
      }
    }
    return futbol;
  }

  ///Update
  Future<void> update(Futbol footBall) async {
    final collection = firestore.collection(collectionName);
    collection.doc(footBall.id).update(footBall.toJson());
  }

  ///Delete

  Future<void> delete(String id) async {
    final collection = firestore.collection(collectionName);
    collection.doc(id).delete();
  }
}