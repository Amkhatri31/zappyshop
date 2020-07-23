import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zappyshop/scanner_cart.dart';

class CartItem extends StatefulWidget {
  String image;
  int price;
  int quantity;
  String item;
  String code;

  CartItem({
    this.image,
    this.item,
    this.price,
    this.quantity,
  });
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void increase(int quantity) {
    setState(() {
      widget.quantity = quantity + 1;
    });
  }

  void decrease(int quantity) {
    setState(() {
      if (quantity <= 0) {
        widget.quantity = 0;
       
      } else {
        widget.quantity = quantity - 1;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset('images/${widget.image}.jpg')
              .box
              .width(150)
              .height(150)
              .padding(VelocityX.m12)
              .make(),
          SizedBox(
            width: 5.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              '${widget.item}'.text.black.size(25.0).make(),
              SizedBox(
                height: 5.0,
              ),
              'Rs ${widget.price}'.text.black.size(20.0).make(),
              SizedBox(
                height: 5.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          decrease(widget.quantity);
                        }).card.circular.white.make(),
                    '${widget.quantity}'.text.size(10.0).black.make(),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          increase(widget.quantity);
                        }).card.circular.white.make(),
                  ],
                ),
              ).box.width(230.0).make(),
            ],
          )
        ],
      ),
    ).card.white.rounded.make();
  }
}
