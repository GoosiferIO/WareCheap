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
import 'package:warecheap/pages/addproductp1.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Future<LocationPermission?> permission() async =>
      await Geolocator.checkPermission();
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  @override
  initState() {
    super.initState();
    _getPhoto();
  }

  void _getPhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext build) {
    if (permission() == LocationPermission.denied ||
        permission() == LocationPermission.deniedForever) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/Browse',
        (route) => false,
      );
    }
    return wcCore.coreUI(
        enableDrawer: false,
        context: context,
        appbarTitle: 'Add Ware',
        bodyContext: ChangeNotifierProvider(
          create: (context) => PlacesListener(),
          child: Container(
            height: 500,
            width: 400.0,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Consumer<PlacesListener>(
                    builder: (context, geoListener, child) {
                      return (geoListener == null)
                          ? Container(
                              height: 300,
                              child: const Center(
                                child: Text('geoListener is null'),
                              ),
                            )
                          : (geoListener.currentPosition == null)
                              ? Container(
                                  height: 300,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(),
                                        TextButton.icon(
                                          icon: Icon(Icons.cancel,
                                              color: wcColors.linkText),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          label: const Text('Cancel',
                                              style: TextStyle(
                                                  color: wcColors.linkText)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                        decoration: InputDecoration(
                                          hintText: 'Search Store',
                                          suffixIcon: Icon(Icons.search),
                                        ),
                                        onChanged: (value) => geoListener
                                            .searchGroceryStores(value),
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 300,
                                          child: GoogleMap(
                                            mapType: MapType.normal,
                                            myLocationEnabled: true,
                                            initialCameraPosition:
                                                CameraPosition(
                                              target: LatLng(
                                                geoListener
                                                    .currentPosition!.latitude,
                                                geoListener
                                                    .currentPosition!.longitude,
                                              ),
                                              zoom: 14.0,
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
                                                        style: TextStyle(
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
                                );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
