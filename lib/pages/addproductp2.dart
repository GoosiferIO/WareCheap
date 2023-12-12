import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warecheap/listeners/wcPlacesListener.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/widgets/wcTextField.dart';

class AddProductLocation extends StatefulWidget {
  const AddProductLocation({Key? key}) : super(key: key);

  @override
  _AddProductLocationState createState() => _AddProductLocationState();
}

class _AddProductLocationState extends State<AddProductLocation> {
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
                          Spacer(),
                          TextButton.icon(
                            icon: Icon(Icons.cancel, color: wcColors.linkText),
                            onPressed: () {
                              Navigator.pop(context);
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
                                        icon: const Icon(Icons.search),
                                        label: 'Search for Grocery Store',
                                        hint: 'Search for Grocery Store',
                                        placesListener: geoListener),
                                    SizedBox(height: 16.0),
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
                                ),
                    ],
                  ),
                  SizedBox(height: 16.0),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductLocation(),
                              ),
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
}
