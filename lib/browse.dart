import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:warecheap/wcCore.dart';
import 'package:flutter/material.dart';
import 'package:warecheap/wcProducts.dart';

class Browse extends StatefulWidget {
  const Browse({Key? key});

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  int _selectedSegment = 0;

  // temporary list of products; will be replaced with Firebase integration
  List<wcProduct> products = [
    wcProduct(
      name: 'Product 1',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 2',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 3',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 4',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 5',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 6',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 7',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
    wcProduct(
      name: 'Product 8',
      brand: 'Product Brand',
      date: 'Product Date',
      price: 'Product Price',
      image: 'assets/Logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context,
      'Browse',
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: const Text(
                    'Add New Ware',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                  child: const Text(
                    'Visit Forum',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 20.0),
                child: const Text(
                  'Search Wares',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: wcColors.primaryText,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                  child: CupertinoSlidingSegmentedControl(
                    children: const <int, Widget>{
                      0: Text('Recent'),
                      1: Text('By Product'),
                      2: Text('By Location'),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        _selectedSegment = value!;
                      });
                    },
                    groupValue: _selectedSegment,
                  ),
                ),
              ),
            ],
          ),
          // This just makes sure that 'current selection' is active.
          Text('Current Selection: $_selectedSegment'),
          Row(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 238, 208),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.only(
                          left: 30.0, top: 20.0, right: 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: products.map((product) {
                          // map products to product cards
                          return product.pCard(product);
                        }).toList(),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
