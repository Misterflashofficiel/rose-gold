import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:rose_gold/screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:rose_gold/screens/signup_screen.dart';

class PassCode extends StatefulWidget {
  PassCode({Key? key}) : super(key: key);

  @override
  _PassCodeState createState() => new _PassCodeState();
}

class _PassCodeState extends State<PassCode> {


  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return
      Scaffold(
        appBar:
        AppBar(
          leading:  Icon(Icons.arrow_back_outlined),
          backgroundColor: Colors.black,),
     body: LockScreen(
        title: "Admin ",
        numColor: Colors.black,
        foregroundColor: Colors.white,
        bgImage: '',
        passLength: myPass.length,
        borderColor: Colors.black,
        showWrongPassDialog: true,
        wrongPassContent: "Vous n'etes pas admin?.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }

          }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }));
        }));
  }
}