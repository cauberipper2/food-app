import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';

import 'login_page.dart';
import 'main_screen.dart';

class ProFileScreen extends StatefulWidget {

  const ProFileScreen({
    Key key,
    this.user
  }): super(key:key);
  final FirebaseUser user;

  @override
  _ProFileScreenState createState() => _ProFileScreenState();
}

class _ProFileScreenState extends State<ProFileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async{
    FirebaseUser user = auth.signOut() as FirebaseUser;

  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('image_02.png'),
                              )
                            ),
                          ),
                      Container(
                        padding: EdgeInsets.only(top:20,left: 20),
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage('https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.0-9/125793088_121413253109289_4906238090059059706_n.jpg?_nc_cat=103&ccb=2&_nc_sid=09cbfe&_nc_ohc=lpOmmr5RcPQAX_O_e7d&_nc_ht=scontent.fsgn2-2.fna&oh=823eba6fb923a2f8f193af5b3ddf19c0&oe=602C5F7E'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 140, 0, 0),
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              )
                            ),
                            child: GestureDetector(
                              onTap: (){
                                  logOut();
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(top:2),
                                child: Text('Đăng xuất',textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25.0,color: Colors.white,wordSpacing: 2.0,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height:5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Stack(
                                  children: <Widget>[
                                    Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.widgets), color: Colors.red, onPressed: (){}
                                            ,
                                          ),
                                          Text('Mã giảm giá',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left:200),
                                            child: IconButton(icon: Icon(Icons.arrow_right)),
                                          )]
                                    )

                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.payment), color: Colors.pinkAccent, onPressed: (){},),
                                    Text('Thanh toán',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:210),
                                      child: IconButton(icon: Icon(Icons.arrow_right)),
                                    )]
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.location_on), color: Colors.blue, onPressed: (){},),
                                    Text('Địa chỉ',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:250),
                                      child: IconButton(icon: Icon(Icons.arrow_right)),
                                    )]
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  height:5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.person), color: Colors.tealAccent.withOpacity(1), onPressed: (){},),
                                    Text('Mời bạn bè',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:210),
                                      child: IconButton(icon: Icon(Icons.arrow_right)),
                                    )]
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.help), color: Colors.purple, onPressed: (){},),
                                    Text('Giúp đỡ',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:240),
                                      child: IconButton(icon: Icon(Icons.arrow_right)),
                                    )]
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.settings), color: Colors.brown, onPressed: (){},),
                                    Text('Cài đặt',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:245),
                                      child: IconButton(icon: Icon(Icons.arrow_right)),
                                    )]
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  height:5,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.only(bottom:10.0,top:10.0),
                  child: Text('Phiên bản 1.0.0',
                    style: TextStyle(fontSize: 18.0,color: Colors.grey,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text('Food app Review & Delivery',
                    style: TextStyle(fontSize: 18.0,color: Colors.grey,fontWeight: FontWeight.bold),
                  ),
                ),



              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap:  (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                    },
                    child: Image.asset('home.png',width: 25,height: 25,)),
                title: Text('Trang chủ')
            ),
            BottomNavigationBarItem(
                icon: Image.asset('shoppingcart.png',width: 25,height: 25,),
                title: Text('Đơn hàng')
            ),
            BottomNavigationBarItem(
                icon: Image.asset('notification.png',width: 25,height: 25,),
                title: Text('Thông báo')
            ),
            BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap:  (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProFileScreen()));
                    },
                    child: Image.asset('person.png',width: 25,height: 25,)),
                title: Text('Tôi'))
          ],
          currentIndex: current,
          onTap: (value){
            setState(() {
              current = value;
            });
          },
        ),

      ),
    );
  }
}



