import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_appfood/screens/forgot_screen.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';
import 'package:flutter_appfood/screens/register_screen.dart';
import 'package:flutter_appfood/screens/welcome_screen.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appfood/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main_screen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  checkAuthentification() async
  {

    _auth.onAuthStateChanged.listen((user) {

      if(user!= null)
      {
        print(user);

        Navigator.push(context, MaterialPageRoute(

            builder: (context)=>MainScreen()));
      }

    });



  }
  @override
  void initState()
  {
    super.initState();
    this.checkAuthentification();
  }
  login()async
  {
    if(_formKey.currentState.validate())
    {

      _formKey.currentState.save();

      try{
        FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
      }

      catch(e)
      {
        showError(e.message);
        print(e);
      }

    }
  }

  showError(String errormessage){

    showDialog(

        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: Text('Lỗi',
                style: TextStyle(color: Colors.red,fontSize: 25.0,fontWeight: FontWeight.bold)
            ),
            content: Text('Tài khoản hoặc mật khẩu không đúng vui lòng nhập lại !',
            style: TextStyle(fontSize:20.0),
            ),

            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },


                  child: Text('Thử lại'))
            ],
          );
        }


    );

  }

  navigateToSignUp()async
  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));

  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return  SafeArea(
      child: Scaffold(
          body:  SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                                Navigator.pushReplacement
                                  (context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 220, 20, 0),
                            child: SizedBox(
                              height: 350.0,
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
                                          blurRadius: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(140, 10, 30, 30),
                                      child: Text('Đăng Nhập',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
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
                                        padding: EdgeInsets.fromLTRB(30, 0, 20, 15),
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
                                        padding: EdgeInsets.fromLTRB(30, 0, 20, 20),
                                        child: TextFormField(
                                          validator: (value){
                                            if(value.length < 6 ){
                                              return 'Mật khẩu không được bé hơn 6 ký tự';
                                            }
                                            else{
                                              _password = value;
                                            }
                                            return null;
                                          },
                                          autocorrect: false,
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
                                        padding: EdgeInsets.only(left: 120,top:0),
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (_formKey.currentState.validate()) {
                                                    Future<String> check =  login();
                                                    if(check != null)
                                                      {
                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                                                      }
                                                  }
                                                  else{
                                                    print('sai passs');
                                                  }
                                                },
                                                  child: Container(
                                                  child: Center(
                                                    child: Text('Đăng nhập',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:20,
                                                            letterSpacing: 1.0,
                                                            fontWeight: FontWeight.bold,
                                                            wordSpacing: 1.0,
                                                          )
                                                      ),
                                                    ),
                                                            )
                                              ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(
                                              builder: (context) => ForGotScreen()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left:180,top:20.0),
                                          child: Text('Quên mật khẩu?',
                                            style: TextStyle(fontSize: 20.0,color: Colors.blue[400],fontWeight: FontWeight.bold),
                                          ),
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
                        Stack(
                          children: <Widget> [
                            Column(
                              children: [

                              ],
                            ),
                          ]
                        ),
                        Container(
                          child: Stack(
                              children: <Widget> [
                                Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: Image.asset('image_02.png'),
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.fromLTRB(100, 10 , 0, 0),
                                  child: SignInButton(
                                    Buttons.Facebook,
                                    onPressed: (){},
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.fromLTRB(100, 50, 0, 0),
                                  child: SignInButton(
                                    Buttons.Google,
                                    onPressed: (){

                                      }
                                  ),
                                ),

                              ]
                          ),
                        )
                        ],
                      ),
                  ),
              ),
                ),
          ),
    );
  }
}



