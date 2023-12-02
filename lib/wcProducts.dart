/*
The wcProducts library creates custom widgets that are used to display the 
products in the app. These widgets are used in the 'Browse' page of the app,
and are flexible enough to be used in other pages as well should the scope
of the app be expanded.

wcProduct: This class is used to test UI features by filling it with dummy data.
In a final production version of the app (or rather, the one we turn in), the
ideal solution will involve Firebase integration to pull data from the database.
*/

import 'package:flutter/material.dart';

/// this class is used to test UI features by filling it with dummy data
class wcProduct {
  // properties
  String? name;
  String? brand;
  String? date;
  String? price;
  String? image;

  // constructor; defines named parameters
  wcProduct({this.name, this.brand, this.date, this.price, this.image});
}

// example usage of wcProduct

// wcProduct myProduct = wcProduct(
//   name: 'Product Name',
//   brand: 'Product Brand',
//   date: 'Product Date',
//   price: 'Product Price',
//   image: 'assets/Logo.png',
// );
