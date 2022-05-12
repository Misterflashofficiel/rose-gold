import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rose_gold/abonnement/abonnementvip.dart';

import '../booking/bookAkA.dart';
import '../drawer/drawer.dart';
import '../screens/add_post_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/profile_screen.dart';


const webScreenSize = 600;

List<Widget> homeScreenItems = [
  DrawerRS(),
  const AddPostScreen(),
  FeedScreen(),
];
