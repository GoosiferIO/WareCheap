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
                        color: wcColors.linkText,
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
                        color: wcColors.linkText,
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
                    margin: const EdgeInsets.only(
                        left: 30.0, top: 20.0, right: 30.0),
                    child: CupertinoSlidingSegmentedControl(
                      backgroundColor: wcColors.bgTertiary,
                      thumbColor: wcColors.bgPrimary,
                      children: const <int, Widget>{
                        0: DefaultTextStyle(
                            style: TextStyle(
                              color: wcColors.primaryText,
                            ),
                            child: Text('Recent')),
                        1: DefaultTextStyle(
                            style: TextStyle(
                              color: wcColors.primaryText,
                            ),
                            child: Text('By Product')),
                        2: DefaultTextStyle(
                            style: TextStyle(
                              color: wcColors.primaryText,
                            ),
                            child: Text('By Location')),
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
            // // This just makes sure that 'current selection' is active.
            // Text('Current Selection: $_selectedSegment'),

            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 100.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 238, 208),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(
                    left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  /* this actually isn't needed, but here for testing. set to 
             NeverScrollableScrollPhysics() to disable scrolling */
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return products[index].pCard(products[index]);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
