import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'homepage_screen.dart';

class DetailScreen extends StatefulWidget {

  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container( child:
                  Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 300.0,
                            child: Carousel(
                              images: [
                                Image.asset('phovietnam1.jpg',width: double.infinity,),
                                Image.asset('phovietnam2.jpg',width: double.infinity),
                                Image.asset('phovietnam3.jpg',width: double.infinity),
                              ],
                              dotBgColor: Colors.white12,
                              dotColor: Colors.grey,
                              dotIncreasedColor: Colors.red,
                              dotIncreaseSize: 1.2,
                              autoplay: true,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:0,top:40),
                            child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen()));
                            },
                              iconSize: 20.0,color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(350, 40, 0, 0),
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.red,
                              iconSize: 25.0,
                              onPressed: (){},
                            ),
                          ),

                        ]
                      ),
                    ],
                  ),
          )
        ),
    );
  }
}
