import 'package:flutter/material.dart';
class AppAccueil extends StatefulWidget {
  const AppAccueil({Key? key}) : super(key: key);

  @override
  State<AppAccueil> createState() => _AppAccueilState();
}

class _AppAccueilState extends State<AppAccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.pink,
        centerTitle: true,
        title: Text('ANNONCES', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [ Colors.black,Colors.black,Colors.pink,Colors.black,Colors.black]),
    ),
    ),
      )
    );
  }
}
