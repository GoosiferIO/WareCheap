import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warecheap/interface/wcCore.dart';
import 'package:flutter/material.dart';
import 'package:warecheap/interface/wcProducts.dart';
import 'package:warecheap/services/wcUploadFile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warecheap/interface/wcTextField.dart';

Future main() async {
  await dotenv.load();
}

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

  Future<void> _addProductPopup(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                color: wcColors.bgPrimary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 500,
              width: 400.0,
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    const Text(
                      'Add New Ware',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: wcColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      child: const GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target:
                                LatLng(39.74567542998422, -121.83336938113182),
                            zoom: 11.0,
                          )),
                    ),
                    const SizedBox(height: 10),
                    wcTextField.tField(
                        label: 'Product Name',
                        icon: const Icon(Icons.abc_outlined)),
                    const SizedBox(height: 10),
                    wcTextField.tField(label: 'Product Brand'),
                    const SizedBox(height: 10),
                    wcTextField.tField(label: 'Product Price'),
                    const SizedBox(height: 10),
                    wcTextField.tField(label: 'Product Location'),
                    const SizedBox(height: 10),
                    wcTextField.tField(label: 'Product Image'),
                    const SizedBox(height: 10),
                    wcTextField.tField(label: 'Product Description'),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
        context,
        'Browse',
        Column(
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
                        _addProductPopup(context);
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
}
