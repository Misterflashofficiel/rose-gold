import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rose_gold/guest/post_card_guest.dart';

import '../utils/colors.dart';
import '../utils/global_variable.dart';
import '../widgets/post_card.dart';

class AccueilGuest extends StatefulWidget {
  const AccueilGuest({Key? key}) : super(key: key);

  @override
  State<AccueilGuest> createState() => _AccueilGuestState();
}

class _AccueilGuestState extends State<AccueilGuest> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text('ROSE GOLD', style: TextStyle(color: Colors.pink, fontSize: 11, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          return ListView.builder(
            itemCount: null,
            itemBuilder: (ctx, index) => Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                horizontal: width > webScreenSize ? width * 0.3 : 0,
                vertical: width > webScreenSize ? 15 : 0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCardGuest(
                  snap: snapshot.data!.docs[index].data(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
