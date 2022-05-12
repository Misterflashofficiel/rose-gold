import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../accueil/postreservt.dart';
import '../responsive/mobile_screen_layout.dart';

class AdminReservation extends StatefulWidget {
  const AdminReservation({Key? key}) : super(key: key);

  @override
  State<AdminReservation> createState() => _AdminReservationState();
}

class _AdminReservationState extends State<AdminReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
      AppBar(
          backgroundColor:  Colors.pink,
          centerTitle: true,
          title: Text('Reservation', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ Colors.black,Colors.black,Colors.pink,Colors.black,Colors.black]),
            ),
          ),
          leading:
          GestureDetector(
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MobileScreenLayout()),
              );
            } ,
            child:
            Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          )

      ),
      body: StreamBuilder(

          stream: FirebaseFirestore.instance.collection('Bookk').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => Container(
                color: Colors.black,
                margin: EdgeInsets.symmetric(
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Postreservt(
                    snap: snapshot.data!.docs[index].data(),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
