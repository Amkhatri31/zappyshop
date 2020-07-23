import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        'Summary'.text.size(30.0).extraBlack.italic.make()
                      ],
                    ),
                  ],
                ),
              ).box.rounded.color(VelocityX.red600).make(),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    'Total'.text.black.size(18.0).make(),
                    '₹1200'.text.black.size(18.0).make(),
                  ],
                ),
              ).card.white.roundedSM.make(),
              Container(
                height: 600.0,
                child: ListView(
                  children: <Widget>[
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                    SummaryItem(),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.assignment),
                      label: 'Proceed to Pay'.text.white.size(20.0).make())
                  .card
                  .roundedLg
                  .red600
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/Oats.jpg'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                'Quaker Oats'.text.black.size(18.0).make(),
                'Strawberry'.text.size(15.0).make(),
                '₹100'.text.black.size(10.0).make(),
                'Qty: 2'.text.black.size(13.0).make(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  '₹200'.text.black.size(20.0).make(),
                ],
              ),
            ),
          ],
        ),
      ),
    ).card.white.rounded.make();
  }
}
