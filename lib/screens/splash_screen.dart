import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/welcome_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'homepage_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  String _email = "";
  String _password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register() async{

    await _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen()));

    });

  }


  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 4), () => Navigator.pushReplacement
      (context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            height: size.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Container(
                                  child: Image.asset('drivers.png'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text('Ứng dụng Review thức ăn ',
                                      style: TextStyle(
                                        fontSize:25.0,color: Colors.white,fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text('& giao thức ăn ',
                                        style: TextStyle(
                                            fontSize:25.0,color: Colors.white,fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(height: 50),
                                Container(
                                  child: SpinKitRipple(color: Colors.white,size: 100,),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
