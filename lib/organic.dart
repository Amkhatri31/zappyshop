import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Organic extends StatefulWidget {
  @override
  _OrganicState createState() => _OrganicState();
}

class _OrganicState extends State<Organic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: VelocityX.red600,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(top: 0.0, left: 45.0, bottom: 5.0),
              title: 'Organic'.text.color(Colors.white70).size(35).bold.make(),
              background: Image.asset(
                'images/veg.jpg',
                fit: BoxFit.fill,
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.darken,
              ).box.roundedSM.make(),
            ),
          ),
          SliverGrid.count(
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            crossAxisCount: 2,
            children: <Widget>[
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
              ItemCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset('images/Oats.jpg')
                .box
                .width(140)
                .height(123)
                .make(),
          ),
          'Vegetable'.text.uppercase.black.size(10.0).make(),
          'Rs 100.00'.text.black.size(10.0).make(),
          FlatButton(
            onPressed: null,
            child: 'Add to cart'.text.white.size(10.0).make(),
          ).wh(100, 40).box.red600.roundedLg.make(),
        ],
      ).box.rounded.white.shadowSm.make(),
    ).box.green100.roundedLg.make();
  }
}

//  SingleChildScrollView(
//         child: Container(
//           child: Hero(
//             tag: 'dash1',
//             child:Image.asset(
//                 'images/veg.jpg',
//                 color: Colors.black.withOpacity(0.6),
//                 colorBlendMode: BlendMode.darken,
//               ).box.roundedSM.make(),
//           ),
//         ),
//       ),
