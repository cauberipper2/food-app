import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Drawer(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Trang chủ'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Tài khoản'),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Giỏ hàng'),
              ),
              GestureDetector(
                onTap: (){
                },
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_rounded),
                  title: Text('Quay lại'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
