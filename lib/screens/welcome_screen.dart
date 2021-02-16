import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';
import 'package:flutter_appfood/screens/register_screen.dart';
import 'login_page.dart';
import 'package:delayed_display/delayed_display.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int timeFactor = 2;

  String _email = "";
  String _password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register() async{

    await _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen()));

    });

  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
    delay: Duration(milliseconds: 400 * timeFactor),
      slidingBeginOffset: const Offset(-1.0,0),
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                              Container(
                                height:820,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.deepOrange.withOpacity(0.8),
                                      Colors.red,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                  ),
                                ),
                                child: Container(
                                    child:
                                    Image.asset('images.png'),

                                ),
                              ),
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 200),
                                    child: Image.asset('banrr.png'),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 200),
                                    child: Image.asset('banrr.png'),
                                  ),
                                ),
                              Center(
                                child: SizedBox(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(30, 560, 30, 20),
                                    width: 300,
                                    child: RaisedButton(
                                      color: Colors.yellowAccent.withOpacity(1),
                                      child: Text('Đăng nhập',style: TextStyle(fontSize:20,color: Colors.brown[500].withOpacity(0.9),fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        Navigator.pushReplacement
                                          (context, MaterialPageRoute
                                          (builder: (context) => LoginPage())
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(left:80,top:50),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top:600),
                                        child: Text('Chưa có tài khoản?',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacement
                                            (context, MaterialPageRoute
                                            (builder: (context) => RegisterScreen())
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(top:600),
                                          child: Text('  Đăng ký ngay?',style: TextStyle(color: Colors.yellowAccent,fontSize: 18.0,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                        ],
                      ),
                    ],
              ),
          ),
      ),
    );
  }
}
