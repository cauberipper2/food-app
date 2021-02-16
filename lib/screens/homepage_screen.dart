import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/detail_screen.dart';
import 'package:flutter_appfood/screens/profile_screen.dart';
import 'drawerScreen.dart';
import 'login_page.dart';

class HomePageScreen extends StatefulWidget {

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  bool _isActive = false ;
  bool _isActiveFavourite = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async{
      FirebaseUser user = auth.signOut() as FirebaseUser;

  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
           body: SingleChildScrollView(
             child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.menu), onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerScreen()));
                                }),
                                Text('Khám phá',style: TextStyle(fontSize:30.0,fontWeight: FontWeight.bold),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => ProFileScreen(),
                                    ));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.0-9/125793088_121413253109289_4906238090059059706_n.jpg?_nc_cat=103&ccb=2&_nc_sid=09cbfe&_nc_ohc=lpOmmr5RcPQAX_O_e7d&_nc_ht=scontent.fsgn2-2.fna&oh=823eba6fb923a2f8f193af5b3ddf19c0&oe=602C5F7E',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              child: Row(
                                children: [
                                  buildTopChip('Yêu thích'),
                                  buildTopChip('Món việt'),
                                  buildTopChip('Món nhật'),
                                  buildTopChip('Món mỹ'),
                                  buildTopChip('Món trung'),
                                  buildTopChip('Món thái'),
                                  buildTopChip('Món hàn'),
                                ],
                              ),
                            ),
                            onTap:(){
                              setState(() {
                                _isActive = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          buildItem(
                            'https://noodle.vn/wp-content/uploads/2020/09/pho-viet-nam-tren-the-gioi-2.jpg',
                            'Phở Việt Nam',
                            '123 đánh giá - S.Oxford 13th', 4.5,
                          ),
                          buildItem(
                            'https://www.sashimihome.com/wp-content/uploads/10-M%C3%B3n-%C4%82n-Truy%E1%BB%81n-Th%E1%BB%91ng-%C4%90%E1%BA%B7c-Tr%C6%B0ng-Trong-V%C4%83n-Ho%C3%A1-%E1%BA%A8m-Th%E1%BB%B1c-Nh%E1%BA%ADt-B%E1%BA%A3n.jpg',
                            'Sushi Nhật bản',
                            ' 325 đánh giá - S.Oxford 14th', 5.0,
                          ),
                          buildItem(
                            'https://www.sieuthithitbo.net/uploads/files/2020/05/14/mon-bo-beefsteak.jpg',
                            'BeefSteak',
                            ' 421 đánh giá - S.Oxford 14th', 8.0,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
           ),
      ),
    );
  }

  Container buildTopChip(String label){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        label: Text(label, style: TextStyle(fontSize:15.0, color: Colors.white)),
        backgroundColor: _isActive ? Colors. grey : Colors.orange,
      ),
    );
  }

  Container buildItem(String url, String title, String subTitle, double rating){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Column(
        children: [
          Stack(
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [BoxShadow(
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      color: Colors.grey
                  )],
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailScreen()));
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(url)
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: <Widget>[
                                Text(title,style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold)),
                                Text(subTitle,style: TextStyle(fontSize: 18.0,color: Colors.grey),)
                              ],
                            ),
                          ),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text(rating.toString()),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ]
          ),
        ],
      ),
    );
  }
}

