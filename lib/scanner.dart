import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zappyshop/organic.dart';
import 'components/all_items.dart';
import 'components/cart_item.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:zappyshop/scanner_cart.dart';

class Scanner extends StatefulWidget {
  static const String id = 'Scanner';
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String result = '000';
  int value = 0;
  int index = 0;
  String qrResult;
  Item item = new Item();
  Allitems all = new Allitems();

  List<Widget> items = [];

  Future _scanQR() async {
    qrResult = await BarcodeScanner.scan();
    setState(() {
      result = qrResult;
    });
    for (Item item in all.ItemData) {
      if (result == item.code) {
        items.add(
          CartItem(
            image: item.image,
            item: item.item,
            price: item.price,
            quantity: item.quantity,
          ),
        );
      }
    }
    result = null;
    return items[index];
  }

  void additem() {
    setState(() {
      value = value + 1;
      index = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'ZappShop'.text.size(30.0).extraBlack.italic.make(),
                SizedBox(
                  height: 10.0,
                ),
                'Scan the items to add them'.text.size(27.0).white.make(),
                'to your cart'.text.size(27.0).white.make(),
              ],
            ),
          ).box.rounded.color(VelocityX.red600).make(),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: this.value,
                itemBuilder: (context, index) => _buildRow(index),
                cacheExtent: 100.0,
                addAutomaticKeepAlives: true,
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                        onPressed: () {
                          additem();
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: 'Add to Cart'.text.white.size(15.0).make())
                    .card
                    .roundedLg
                    .red600
                    .make(),
                FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScannerCart(items: items),
                              ));
                        },
                        icon: Icon(Icons.check_circle),
                        label: 'Check'.text.white.size(15.0).make())
                    .card
                    .roundedLg
                    .red600
                    .make(),
                FlatButton.icon(
                        onPressed: _scanQR,
                        icon: Icon(Icons.camera_alt),
                        label: 'Scan'.text.white.size(15.0).make())
                    .card
                    .roundedLg
                    .red600
                    .make(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildRow(int index) {
    return items[index];
  }
}
