import 'package:flutter/material.dart';
import 'package:rose_gold/a/passecode.dart';

import '../screens/signup_screen.dart';

class PageAccueil2 extends StatefulWidget {
  const PageAccueil2({Key? key}) : super(key: key);

  @override
  State<PageAccueil2> createState() => _PageAccueil2State();
}

class _PageAccueil2State extends State<PageAccueil2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Center(
            child: Image.asset('assets/RG-LOGO.png',
              height: 300 ,
              width: 350,),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton( onPressed:  () => Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) =>  PassCode(),
    ),
    ),
                child: Text('Admin', style: TextStyle(color: Colors.black),),),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton( onPressed:  () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  SignupScreen(),
              ),
            ),
              child: Text('Utilisateur'),),
          ),
        ],
      ),
    );
  }
}
