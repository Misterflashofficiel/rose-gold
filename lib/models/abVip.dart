import 'package:cloud_firestore/cloud_firestore.dart';

class BookRS {
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String email;
  final String date;
  final String heure;

  const BookRS(
      {
        required this.uid,
        required this.username,
        required this.postId,
        required this.datePublished,
        required this.email,
        required this.date,
        required this.heure,
      });

  static BookRS fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return BookRS(
        uid: snapshot["uid"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        email: snapshot['email'],
        date: snapshot['DateBooking'],
        heure: snapshot['heureBooking']
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    'email': email,
    'DateBooking': date,
    'heureBooking': heure
  };
}
