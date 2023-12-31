/*
The wcProducts library creates custom widgets that are used to display the 
products in the app. These widgets are used in the 'Browse' page of the app,
and are flexible enough to be used in other pages as well should the scope
of the app be expanded.

pCard: Styles each product as a card with a thumbnail, name, price, and store.
*/

import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/pages/product.dart';

/// this class is used to test UI features by filling it with dummy data
class wcProduct {
  // properties
  String? name;
  DateTime? date;
  double? price;
  String? image;
  String? store;
  String? dept;
  BuildContext? context; // context of the page that the product is displayed on
  String? id; // id of the product in the database

  // constructor; defines named parameters
  wcProduct({
    this.context,
    this.dept,
    this.name,
    this.store,
    this.date,
    this.price,
    this.image,
    this.id,
  });

  Widget pCard(wcProduct product) {
    return Card(
      color: wcColors.bgCard,
      elevation: 2.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Expanded(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  product.image!,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/placeholder.png',
                    );
                  },
                ),
              ),
            ),
            title: Text(product.name!),
            titleTextStyle: const TextStyle(
              color: wcColors.linkText,
              fontWeight: FontWeight.bold,
            ),
            subtitle: Container(
                width: 50,
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: wcColors.bgAlert,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("\$${product.price!.toString()}")),
            subtitleTextStyle: const TextStyle(
              color: wcColors.bgPrimary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: wcColors.linkText,
                ),
                child: const Text('View'),
                onPressed: () {
                  if (product.context != null)
                    Navigator.pushAndRemoveUntil(
                        context!,
                        MaterialPageRoute(
                            builder: (route) => ProductPage(
                                  product: product,
                                )),
                        (route) => false);
                  else
                    print('Product page context is null');
                },
              ),
              const SizedBox(width: 8),
              Text(
                style: const TextStyle(
                  // ignore: deprecated_member_use
                  color: wcColors.primaryText,
                ),
                '${product.store != null ? product.store : 'None'}',
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}



// example usage of wcProduct

// wcProduct myProduct = wcProduct(
//   name: 'Product Name',
//   brand: 'Product Brand',
//   date: 'Product Date',
//   price: 'Product Price',
//   image: 'assets/Logo.png',
// );
