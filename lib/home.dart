import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'organic.dart';
import 'page1.dart';

class Home extends StatefulWidget {
  static const String id='Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  'Hi Avinash,'.text.size(30.0).white.make(),
                  SizedBox(
                    height: 5.0,
                  ),
                  'What type of food do you eat?'.text.size(27.0).white.make(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.carrot),
                              onPressed: () {
                                Navigator.of(context).push(_createRoute());
                              }).card.circular.white.make(),
                          SizedBox(
                            height: 5.0,
                          ),
                          'Anything'.text.white.size(15.0).bold.make(),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                                  icon: FaIcon(FontAwesomeIcons.leaf),
                                  onPressed: null)
                              .card
                              .circular
                              .white
                              .make(),
                          SizedBox(
                            height: 5.0,
                          ),
                          'Organic'.text.white.size(15.0).bold.make(),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                                  icon: FaIcon(FontAwesomeIcons.candyCane),
                                  onPressed: null)
                              .card
                              .circular
                              .white
                              .make(),
                          SizedBox(
                            height: 5.0,
                          ),
                          'Gluten-free'.text.white.size(15.0).bold.make(),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                                  icon: FaIcon(FontAwesomeIcons.apple),
                                  onPressed: null)
                              .card
                              .circular
                              .white
                              .make(),
                          SizedBox(
                            height: 5.0,
                          ),
                          'Fruits'.text.white.size(15.0).bold.make(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ).box.rounded.color(VelocityX.red600).make(),
            Container(
              height: 250.0,
              child: SizedBox(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Product(
                      image: 'veg',
                      name: 'Vegetables',
                      tag: 'dash1',
                    ),
                    Product(
                      image: 'fruits',
                      name: 'Fruits',
                      tag: 'dash2',
                    ),
                    Product(
                      image: 'amul',
                      name: 'Dairy',
                      tag: 'dash3',
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  String name;
  String image;
  String tag;

  Product({this.image, this.name, this.tag});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Organic(),
                  ));
            },
            child: Hero(
              tag: tag,
              child: Image.asset(
                'images/$image.jpg',
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.darken,
              ).card.roundedSM.make(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 60.0),
            child: Container(
              child:
                  name.text.color(Colors.white70).center.size(35).bold.make(),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Organic(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
