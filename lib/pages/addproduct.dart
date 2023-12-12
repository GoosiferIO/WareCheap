import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:warecheap/widgets/wcGroceryDepartmentSelector.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warecheap/widgets/wcTextField.dart';
import 'package:warecheap/listeners/wcPlacesListener.dart';
import 'package:warecheap/pages/addproductp2.dart';
import 'dart:io';
import 'package:warecheap/models/wcImageModel.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Future<LocationPermission?> permission() async =>
      await Geolocator.checkPermission();

  // Future<void> initializeData() async {
  //   try {
  //     _getPhoto();
  //     print(imageFile!.path);
  //   } catch (e) {
  //     print(e);
  //     //Navigator.pop(context);
  //   }
  // }

  @override
  initState() {
    super.initState();
    //initializeData();
  }

  @override
  dispose() {
    super.dispose();
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
        bodyContext: Container(
          width: 400.0,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
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
                      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                Container(
                  color: wcColors.bgPrimaryAccent,
                  child: SizedBox(
                    child: Provider.of<ImageModel>(context).imageFile != null
                        ? Image.file(
                            Provider.of<ImageModel>(context).imageFile!)
                        : Placeholder(
                            fallbackHeight: 300,
                            fallbackWidth: double.infinity,
                            child: Image.network(
                              'https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                            )),
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 16.0),
                wcTextField.tField(
                  icon: const Icon(Icons.text_fields, color: wcColors.linkText),
                  label: 'Product Name',
                  hint: 'Enter product name',
                ),
                SizedBox(height: 16.0),
                wcTextField.tField(
                  icon: const Icon(Icons.money, color: wcColors.linkText),
                  label: 'Price',
                  hint: 'Enter product price',
                ),
                SizedBox(height: 16.0),
                GroceryDepartmentSelector(),
                SizedBox(height: 16.0),
                TextButton(
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
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ));
  }
}
