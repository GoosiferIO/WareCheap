// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warecheap/widgets/wcTextField.dart';
import 'package:warecheap/listeners/wcPlacesListener.dart';
import 'package:warecheap/pages/addproduct.dart';

// Future main() async {
//   await dotenv.load();
// }

class Browse extends StatefulWidget {
  const Browse({Key? key});

  @override
  // ignore: library_private_types_in_public_api
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

  // Future<void> _addProductPopup(BuildContext context) async {
  //   LocationPermission? permission = await Geolocator.checkPermission();
  //   // geoLocatorListener geoListener = geoLocatorListener();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     permission = await Geolocator.requestPermission();
  //   } else {
  //     return showDialog<void>(
  //       context: context,
  //       builder: (context) {
  //         return
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
        context: context,
        appbarTitle: 'Browse',
        bodyContext: Column(
          children: <Widget>[
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
                  color: wcColors.bgTertiaryAccent,
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 30.0, bottom: 20.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(_createAddProductRoute());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          wcColors.bgPrimaryAccent,
                        ),
                      ),
                      child: TextButton.icon(
                        label: const Text(
                          'Add New Ware',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: wcColors.primaryText,
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            wcColors.bgPrimaryAccent,
                          ),
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Route _createAddProductRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddProduct(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
