import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zappyshop/home.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zappyshop/Page1.dart';
import 'package:zappyshop/organic.dart';
import 'package:zappyshop/scanner.dart';
import 'package:zappyshop/cart.dart';
import 'package:zappyshop/summary.dart';

void main() => runApp(
      ZappShop(),
    );

class ZappShop extends StatefulWidget {
  @override
  _ZappShopState createState() => _ZappShopState();
}

class _ZappShopState extends State<ZappShop> {
  int currentIndex;

  List<Widget> body = [
    Home(),
    Scanner(),
    Page1(),
    Cart(),
    Summary(),
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.deepPurple,
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.camera_alt,
                  color: Colors.deepPurple,
                ),
                title: Text("Scan")),
            BubbleBottomBarItem(
                backgroundColor: Colors.indigo,
                icon: Icon(
                  Icons.explore,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.location_city,
                  color: Colors.indigo,
                ),
                title: Text("Explore")),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: FaIcon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
                title: Text("Cart")),
            BubbleBottomBarItem(
                backgroundColor: Colors.lightBlue,
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  color: Colors.black,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.userAlt,
                  color: Colors.lightBlue,
                ),
                title: Text("Account")),
          ],
        ),
        body: body.elementAt(currentIndex),
      ),
    );
  }
}
