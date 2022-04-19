import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rose_gold/accueil_general/page_accueil2.dart';
import 'package:rose_gold/guest/login.dart';
class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PageAccueil2())));
  }
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
          CircularProgressIndicator(
            color: Colors.purple.shade200,
          )
        ],
      ),
    );
  }
}
