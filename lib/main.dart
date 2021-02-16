import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/detail_screen.dart';
import 'package:flutter_appfood/screens/forgot_screen.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';
import 'package:flutter_appfood/screens/login_page.dart';
import 'package:flutter_appfood/screens/main_screen.dart';
import 'package:flutter_appfood/screens/profile_screen.dart';
import 'package:flutter_appfood/screens/register_screen.dart';
import 'package:flutter_appfood/screens/splash_screen.dart';
import 'package:flutter_appfood/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';


void main()  {
  return runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      child: MaterialApp(
          home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
