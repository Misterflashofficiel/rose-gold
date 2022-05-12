import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rose_gold/resources/storage_methods.dart';
import '../models/user.dart'as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty  ||
             file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

      String photoUrl = await  StorageMethods().uploadImageToStorage("profilePics", file, false);
        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set({
          "username" : username,
          "password" : password,
          "uid" : cred.user!.uid,
          "email" : email,
          "bio" : bio,
          'followers' : [],
          'following' : [],
          "photoUrl" : photoUrl,
        });

        res = "success";
      }

      else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException  catch (err) {
      if (err.code ==  'invalid-email'){
        res = "L email est mal saisie";
      } else if (err.code ==  'Mot de passe court'){
        res = "Le mot de passe est court";
      }
    }

    catch (err) {
      return 'verifier les saisies';
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return "Compte introuvable";
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
