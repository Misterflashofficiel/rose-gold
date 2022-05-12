import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import '../utils/global_variable.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: width > webScreenSize
          ? null
          : AppBar(
          backgroundColor:  Colors.pink,
          centerTitle: true,
          title: Text('ANNONCES', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ Colors.black,Colors.black,Colors.pink,Colors.black,Colors.black]),
            ),
          ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
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
              color: Colors.white,
              margin: EdgeInsets.symmetric(
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(
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
