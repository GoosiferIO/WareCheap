import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warecheap/listeners/wcPlacesListener.dart';
import 'package:provider/provider.dart';

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
            return Column(
              children: [
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
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    hintText: 'Search Store',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (value) =>
                                      geoListener.searchGroceryStores(value),
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
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                          geoListener.currentPosition!.latitude,
                                          geoListener
                                              .currentPosition!.longitude,
                                        ),
                                        zoom: 14.0,
                                      ),
                                    ),
                                  ),
                                  if (geoListener.searchResults != null &&
                                      geoListener.searchResults!.length != 0)
                                    Container(
                                        height: 300.0,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.6),
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
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  geoListener
                                                      .searchResults![index]
                                                      .description,
                                                  style: TextStyle(
                                                      color: Colors.white),
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
            );
          }),
        ));
  }
}
