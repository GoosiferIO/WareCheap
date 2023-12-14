import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warecheap/listeners/wcPlacesListener.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/widgets/wcTextField.dart';
import 'package:warecheap/models/wcProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warecheap/services/wcUploadFile.dart';
import 'dart:async';

class AddProductLocation extends StatefulWidget {
  final ProductModel product;
  const AddProductLocation({Key? key, required this.product}) : super(key: key);

  @override
  _AddProductLocationState createState() => _AddProductLocationState();
}

class _AddProductLocationState extends State<AddProductLocation> {
  final TextEditingController _locationController = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

  void _submitForm() {
    String fileName = "${DateTime.now()}";
    try {
      uploadFile(widget.product.imageDir ?? '', "${urlify(fileName)}.jpg");
      // add product to Firebase
      FirebaseFirestore.instance.collection('wcProducts').add({
        'name': widget.product.name,
        'price': widget.product.price,
        'storeID': widget.product.storeID,
        'storeName': widget.product.storeName,
        'imageDir': getGroceryPicture("${urlify(fileName)}.jpg"),
        'department': widget.product.department,
        'geoloc': widget.product.geoloc,
        'dateAdded': DateTime.now(),
      });
      // go back to browse page
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/Browse',
        (route) => false,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext build) {
    // final geoListener = Provider.of<PlacesListener>(context);
    return wcCore.coreUI(
        context: context,
        enableDrawer: false,
        bodyContext: ChangeNotifierProvider(
          create: (context) => PlacesListener(),
          child:
              Consumer<PlacesListener>(builder: (context, geoListener, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          TextButton.icon(
                            icon: const Icon(Icons.cancel,
                                color: wcColors.linkText),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/Browse',
                                (route) => false,
                              );
                            },
                            label: const Text('Cancel',
                                style: TextStyle(color: wcColors.linkText)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const Text(
                              'Add New Ware',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: wcColors.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      (geoListener == null)
                          ? Container(
                              height: 300,
                              child: const Center(
                                child: Text('geoListener is null'),
                              ),
                            )
                          : (geoListener.currentPosition == null)
                              ? Container(
                                  height: 300,
                                  color: wcColors.bgPrimaryAccent,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Column(
                                  children: [
                                    wcTextField.locationSearchField(
                                        controller: _locationController,
                                        icon: const Icon(Icons.search),
                                        label: 'Search for Grocery Store',
                                        hint: 'Search for Grocery Store',
                                        placesListener: geoListener),
                                    const SizedBox(height: 16.0),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 300,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: GoogleMap(
                                              mapType: MapType.normal,
                                              myLocationEnabled: true,
                                              initialCameraPosition:
                                                  CameraPosition(
                                                target: LatLng(
                                                  geoListener.currentPosition!
                                                      .latitude,
                                                  geoListener.currentPosition!
                                                      .longitude,
                                                ),
                                                zoom: 14.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (geoListener.searchResults != null &&
                                            geoListener.searchResults!.length !=
                                                0)
                                          Container(
                                              height: 300.0,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.black
                                                      .withOpacity(.6),
                                                  backgroundBlendMode:
                                                      BlendMode.darken)),
                                        if (geoListener.searchResults != null)
                                          Positioned(
                                            top: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            bottom: 0.0,
                                            child: Container(
                                              height: 300.0,
                                              child: ListView.builder(
                                                  itemCount: geoListener
                                                      .searchResults!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      title: Text(
                                                        geoListener
                                                            .searchResults![
                                                                index]
                                                            .description,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              wcColors.bgPrimaryAccent,
                            ),
                          ),
                          onPressed: () {
                            widget.product.storeName =
                                _locationController.text.toString();
                            _submitForm(); // add product to Firebase
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/Browse',
                              (route) => false,
                            );
                          },
                          child: const Text('Complete'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }

  // lets us update the map to the current location
  Future<void> _goToPlace(PlacesListener geoListener) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(geoListener.currentPosition!.latitude,
            geoListener.currentPosition!.longitude),
        zoom: 14.0)));
  }
}
