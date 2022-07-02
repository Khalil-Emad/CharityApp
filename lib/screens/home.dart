import 'package:bexeltask/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/rowCard.dart';
import 'products.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Get.to(() => HomeScreen());
      } else {
        Get.to(() => Products());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Products',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 46, 68, 80), Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(30),
                            constraints: BoxConstraints.expand(
                                height: size.height * .37),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 4, 14, 111),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Get.to(() => SplashScreen());
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Food',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/images/pic.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select your plan and enjoy a warm lunch or dinner at your home",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 130, left: 20),
                            width: size.width,
                            height: size.height * .6,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  RowCard(
                                      color: Color(0xffbFFC14F),
                                      num: '1',
                                      price: '12'),
                                  RowCard(
                                      color: Color(0xffbFF6868),
                                      num: '2',
                                      price: '18'),
                                  RowCard(
                                      color: Color(0xffbFFC14F),
                                      num: '3',
                                      price: '22'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * .77,
                            margin: EdgeInsets.only(top: 330),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 30, bottom: 5),
                                  child: Text(
                                    "Our Features",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 2, 45, 80),
                                        fontSize: 22),
                                  ),
                                ),
                                Container(
                                  height: size.height * .55,
                                  child: ListView(
                                    children: getItems(),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> cards = [
    "Order your meal online",
    "Schedule as per your ease",
    "Track Delivery",
    "Enjoy a warm meal",
  ];

  Map cardsImage = {
    "Order your meal online": Image.asset(
      "assets/images/online-shop.png",
    ),
    "Schedule as per your ease": Image.asset(
      "assets/images/calendar.png",
    ),
    "Track Delivery": Image.asset(
      "assets/images/maps.png",
    ),
    "Enjoy a warm meal": Image.asset(
      "assets/images/hot-food1.png",
    ),
  };

  Widget getCards(text) {
    Size size = MediaQuery.of(context).size;
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 40),
      height: size.height * .22,
      width: size.width * .37,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 229, 229),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width * .15,
              height: size.height * .1,
              child: cardsImage[text],
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 45, 80),
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getItems() {
    List<Widget> containers = [];
    List<Widget> rows = [];
    int i = 0;
    for (String card in cards) {
      if (i < 2) {
        rows.add(getCards(card));
        i++;
      } else {
        i = 0;
        containers.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCards(card));
        i++;
      }
    }
    if (rows.length > 0) {
      containers.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return containers;
  }
}
