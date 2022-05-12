import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_gold/a/passecode.dart';
import 'package:rose_gold/accueil_general/page_accueil.dart';
import 'package:rose_gold/booking/bookAkA.dart';
import 'package:rose_gold/providers/user_provider.dart';
import 'package:rose_gold/responsive/mobile_screen_layout.dart';
import 'package:rose_gold/responsive/responsive_layout.dart';
import 'package:rose_gold/responsive/web_screen_layout.dart';
import 'package:rose_gold/screens/feed_screen.dart';
import 'package:rose_gold/screens/login_screen.dart';
import 'package:rose_gold/abonnement/payment.dart';
import 'package:rose_gold/screens/signup_screen.dart';
import 'package:rose_gold/utils/colors.dart';
import 'package:uuid/uuid.dart';

import 'abonnement/abonnementvip.dart';
import 'drawer/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCkldtR3tT-gC7Wvkpo__QrRCG4s-hufFo",
          appId: "1:240837637559:android:581b7c943afe26c012e432",
          messagingSenderId: "240837637559",
          projectId: "rosegold9-3beb7",
          storageBucket: 'rosegold9-3beb7.appspot.com'
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'rosegold',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
