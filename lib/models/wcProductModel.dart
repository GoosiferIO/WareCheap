import 'package:flutter/material.dart';

class ProductModel {
  // Specific to product
  String? name;
  double? price;
  String? storeID;
  String? storeName;
  String? imageDir;
  String? department;

  // Specific to 'add product' form
  String? geoloc;

  ProductModel({
    this.name,
    this.price,
    this.storeID,
    this.storeName,
    this.imageDir,
    this.department,
    this.geoloc,
  });
}
