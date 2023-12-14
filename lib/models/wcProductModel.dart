import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  // properties
  String? name;
  double? price;
  String? storeID;
  String? storeName;
  String? imageDir;
  String? department;
  DateTime? dateAdded;
  String? productID;

  // // Specific to 'add product' form
  // String? geoloc;

  // named parameters in constructor
  ProductModel({
    this.name,
    this.price,
    this.storeID,
    this.storeName,
    this.imageDir,
    this.department,
    // this.geoloc,
    this.dateAdded,
    this.productID, // document ID on Firestore
  });

  // assigns values from Firestore to ProductModel properties
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    return ProductModel(
      name: doc['name'],
      price: doc['price'],
      storeID: doc['storeID'],
      storeName: doc['storeName'],
      imageDir: doc['imageDir'],
      department: doc['department'],
      dateAdded: (doc['dateAdded'] as Timestamp).toDate(),
      // geoloc: doc['geoloc'],
      productID: doc.id,
    );
  }
}
