import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'components/cart_item.dart';

class ScannerCart extends StatelessWidget {
  CartItem cartItem = new CartItem();

  final List<Widget> items;

  ScannerCart({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 30.0,
                        ),
                        'Your Cart'.text.size(30.0).extraBlack.italic.make(),
                      ],
                    ),
                  ],
                ),
              ).box.rounded.color(VelocityX.red600).make(),
              Container(
                height: 680.0,
                child: SizedBox(
                  child: AnimationLimiter(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Column(
                                        children: items,
                                      ),
                                    )));
                          })),
                ),
              ),
              FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.assignment),
                      label: 'Summary'.text.white.size(20.0).make())
                  .card
                  .roundedLg
                  .red600
                  .make()
            ],
          ),
        ),
      ).box.white.make(),
    );
  }
}
