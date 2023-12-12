// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';
import 'package:warecheap/widgets/wcCam.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warecheap/models/wcProductModel.dart';

// Future main() async {
//   await dotenv.load();
// }

class Browse extends StatefulWidget {
  const Browse({Key? key});
  // temporary list of products; will be replaced with Firebase integration

  @override
  // ignore: library_private_types_in_public_api
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  int _selectedSegment = 0;
  List<ProductModel> _products = []; // list of products from Firestore
  List<wcProduct> _prettyProducts = []; // list of products to display

  @override
  void initState() {
    super.initState();
    _fetchProductsFromFirestore(0);
  }

  void _fetchProductsFromFirestore(int segment) async {
    Query query;
    switch (segment) {
      case 0: // Recent
        query = FirebaseFirestore.instance
            .collection('wcProducts')
            .orderBy('dateAdded', descending: true)
            .limit(10);
        break;
      case 1: // By Product
        query = FirebaseFirestore.instance
            .collection('wcProducts')
            .orderBy('name')
            .limit(10);
        break;
      case 2: // By Location
        query = FirebaseFirestore.instance
            .collection('wcProducts')
            .orderBy('geoloc')
            .limit(10);
        break;
      default:
        return;
    }

    // grab product from Firestore
    query.get().then((QuerySnapshot querySnapshot) {
      print("QuerySnapshot length is:  ${querySnapshot.size}");

      List<ProductModel> fetchedProducts = querySnapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .toList();
      print("Fetched product length is:  ${fetchedProducts.length}");
      setState(() {
        _products = fetchedProducts;
        _prettyProducts = _products
            .map((product) => wcProduct(
                  name: (product.name == null ? 'Unknown' : product.name!),
                  price: (product.price == null ? 0.0 : product.price!),
                  store: (product.storeName == null
                      ? 'Unknown'
                      : product.storeName!),
                  image: (product.imageDir == null
                      ? 'assets/images/placeholder.png'
                      : product.imageDir!),
                  dept: (product.department == null
                      ? 'Unknown'
                      : product.department!),
                  date: (product.dateAdded == null
                      ? DateTime.now()
                      : product.dateAdded!),
                ))
            .toList();
        print("Pretty products length is:  ${_prettyProducts.length}");
      });
    }).catchError((error) {
      print(error);
    });
  }

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
                          _fetchProductsFromFirestore(_selectedSegment);
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
                  itemCount: _prettyProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _prettyProducts[index].pCard(_prettyProducts[index]);
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
                    child: Expanded(
                      child: TextButton(
                        onPressed: () {
                          wcCamState(context).getPhoto();
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
                ),
              ],
            ),
          ],
        ));
  }

  // Route _createAddProductRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const wcCam(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(1.0, 0.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}
