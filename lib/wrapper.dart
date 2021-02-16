import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/homepage_screen.dart';
import 'package:flutter_appfood/screens/login_page.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null){
      return LoginPage();
    }else{
      return HomePageScreen();
    }
  }
}
