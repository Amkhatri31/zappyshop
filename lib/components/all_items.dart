import 'package:flutter/material.dart';

class Item {
  String image;
  int price;
  int quantity;
  String item;
  String detail;
  String code;

  Item(
      {this.code,
      this.detail,
      this.image,
      this.item,
      this.price,
      this.quantity});
}

class Allitems {
  List<Item> ItemData = [
    Item(
      code: '1001',
      image: 'veg',
      item: 'Cadbury Bournvita',
      price: 100,
      quantity: 1,
    ),
    Item(
      code: '1002',
      image: 'veg',
      item: 'Cadbury Oreo',
      price: 75,
      quantity: 1,
    ),
    Item(
      code: '1003',
      image: 'veg',
      item: 'Quaker Oats',
      price: 200,
      quantity: 1,
    ),
    Item(
      code: '1004',
      image: 'veg',
      item: 'Nestle Maggi',
      price: 23,
      quantity: 1,
    ),
    Item(
      code: '1005',
      image: 'sauce',
      item: 'Maggi Hot n Sweet',
      detail: '1 X 1 Kg',
      price: 120,
      quantity: 1,
    ),
    Item(
      code: '1006',
      image: 'Lays',
      item: 'Lays Cream and Onion',
      price: 10,
      quantity: 1,
    ),
    Item(
      code: '1007',
      image: 'chocochip',
      item: 'Amul Chocochip ice cream',
      price: 140,
      quantity: 1,
    ),
  ];
}
