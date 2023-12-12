import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  // Specific to product
  String? name;
  double? price;
  String? storeID;
  String? storeName;
  String? imageDir;
  String? department;
  DateTime? dateAdded;

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
    this.dateAdded,
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    return ProductModel(
      name: doc['name'],
      price: doc['price'],
      storeID: doc['storeID'],
      storeName: doc['storeName'],
      imageDir: doc['imageDir'],
      department: doc['department'],
      dateAdded: (doc['dateAdded'] as Timestamp).toDate(),
      geoloc: doc['geoloc'],
      // Initialize other fields
    );
  }
}
