import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rose_gold/models/abVip.dart';
import 'package:rose_gold/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

class FireStoreMethodsRS {
  final FirebaseFirestore _firestoreRS = FirebaseFirestore.instance;

  Future<String> uploadBookRS(String uid,
      String username, String email,String postId, String date, String heure) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postId = Uuid().v1(); // creates unique id based on time
      BookRS bookRS  = BookRS(
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        email: email,
        date: date,
        heure: heure
      );
      _firestoreRS.collection('Bookk').doc(postId).set(bookRS.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  ///Future<String> deletePost(String postId) async {
    ///String res = "Some error occurred";
    ///try {
      ///await _firestore.collection('posts').doc(postId).delete();
      ///res = 'success';
    ///} catch (err) {
///  res = err.toString();
  /// }
/// return res;
///}
}