import 'package:demoapp/screens/home.dart';
import 'package:demoapp/screens/post_home.dart';
import 'package:demoapp/screens/post_page.dart';
import 'package:demoapp/screens/register.dart';
import 'package:demoapp/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData(
      accentColor: Colors.black38,
      scaffoldBackgroundColor: Colors.black87,
      brightness: Brightness.dark,
      fontFamily: 'DM Sans',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: {
      '/': (context) => Splash(),
      '/register': (context) => Register(),
      '/home': (context) => Home(),
      '/post_home': (context) => PostHome(),
      '/post_page': (context) => PostPage(),
    },
  ));
}
