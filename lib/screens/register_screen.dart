import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/models/user.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';
import 'package:flutter_appfood/screens/login_page.dart';
import 'package:flutter_appfood/screens/main_screen.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _email = "";
  String _password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register() async{

    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email.trim(), password: _password)) as FirebaseUser;

     Navigator.pushReplacement(context, MaterialPageRoute(
       builder: (context) => MainScreen()
     ));
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                children: <Widget>
                [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                                image: AssetImage('How-to-Start-a-Food-Delivery-Business.png')
                            )
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
                        child: SizedBox(
                          height: 550.0,
                          width: double.infinity,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0,15.0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(160,10, 30, 30),
                                  child: Text('Đăng ký',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(50, 40, 20, 10),
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white24,
                                            offset: Offset(0.0,15.0),
                                            blurRadius: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(50, 0, 30, 20),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value){
                                        if(value.isEmpty || !value.contains('@')){
                                          return 'Email không hợp lệ';
                                        }else{
                                          _email = value;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email_sharp),
                                          hintText: 'Email' ,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(50, 0, 30, 20),
                                    child: TextFormField(
                                      validator: (value){
                                        if(value.length < 6){
                                          return 'Mật khẩu phải chứa từ 6 ký tự trở lên';
                                        }else{
                                          _password = value;

                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        _email = value;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          hintText: 'Mật khẩu' ,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8.0),
                                              )
                                          )
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(left:130,top:0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 165.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF17ead9),
                                                Color(0xFF6078ea)
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(6.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xFF6078ea).withOpacity(.3),
                                                  offset: Offset(0.0,8.0),
                                                  blurRadius: 8.0
                                              )
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){},
                                              child: Center(child: GestureDetector(
                                                onTap: (){

                                                },
                                                child: GestureDetector(
                                                  onTap: (){
                                                    if(formKey.currentState.validate()) {
                                                      register();
                                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                                          builder: (context) => MainScreen()
                                                      ));

                                                    }
                                                  },
                                                  child: Text('Đăng ký',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:18,
                                                        letterSpacing: 1.0
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
