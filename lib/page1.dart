import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'organic.dart';
import 'components/cart_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zappyshop/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          children: [
            Column(
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
                      'What type of food do you eat?'
                          .text
                          .size(27.0)
                          .white
                          .make(),
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
          ],
          duration: const Duration(milliseconds: 150),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page1(),
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
