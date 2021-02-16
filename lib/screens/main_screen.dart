import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfood/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key key,
    this.user
}): super(key:key);
  final FirebaseUser user;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _selectedIcon = 0;
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync:  this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Stack(
                            children: <Widget>[
                              Container(
                                width: 390,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.grey[300],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0.0,15.0),
                                      blurRadius: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top:0,
                                bottom: 0,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                                child: Text('Hôm nay bạn muốn ăn gì ?',
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    height: 200,
                    child: Carousel(
                      images: [
                        AssetImage('sale1.png'),
                        AssetImage('deal2.png'),
                        AssetImage('deal3.png'),
                      ],
                      dotBgColor: Colors.white12,
                      dotColor: Colors.grey,
                      dotIncreasedColor: Colors.red,
                      dotIncreaseSize: 1.2,
                      autoplay: true,
                      boxFit: BoxFit.cover,
                      dotSize: 5,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 1,
                    color: Colors.brown.withOpacity(0.5),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _foodList('rice.png','Cơm'),
                        _foodList('noodle.png','Mì'),
                        _foodList('milktea.png','Trà sữa'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _foodList('bread.png','Bánh mì'),
                        _foodList('tea.png','Trà'),
                        _foodList('coffee.png','Cà phê'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _foodList('seafood.png','Hải sản'),
                        _foodList('pizza.png','Pizza'),
                        _foodList('pho.png','Phở'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left:10),
                        child: Text('Hải sản tươi sống',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,
                              color: Colors.black
                            )),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    height: 200,
                    child: Carousel(
                      images: [
                        AssetImage('cua.jpg'),
                        AssetImage('cuatuyet.jpg'),
                        AssetImage('tom.jpg'),
                      ],
                      dotBgColor: Colors.white12,
                      dotColor: Colors.grey,
                      dotIncreasedColor: Colors.red,
                      dotIncreaseSize: 1.2,
                      autoplay: true,
                      boxFit: BoxFit.cover,
                      dotSize: 5,
                    ),
                  ),


                ],
              ),
            ),

          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue.withOpacity(0.1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red.withOpacity(1),

            items: [
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap:  (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                      },
                      child: Image.asset('home.png',width: 25,height: 25,)),
                  title: Text('Trang chủ',style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('shoppingcart.png',width: 25,height: 25),
                  title: Text('Giỏ hàng',style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('notification.png',width: 25,height: 25,),
                  title: Text('Thông báo',style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap:  (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProFileScreen()));
                      },
                      child: Image.asset('person.png',width: 25,height: 25,)),
                  title: Text('Tôi'
                    ,style: TextStyle(fontWeight: FontWeight.bold),))
            ],
            currentIndex: _selectedIcon,
            onTap: (value){
              setState(() {
                _selectedIcon = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

Container _foodList(String url , String name){
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white12.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 3.0,
          ),
        ],
      ),
      height: 110,
      width: 100,
      child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 15.0,
                      blurRadius: 15.0,
                      offset: Offset(0.0,15.0)
                  ),
                ],
              ),
              child: Card(
                child: Image.asset(url,width: 120,height: 80,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            Text(name)
          ]
      )
  );
}

