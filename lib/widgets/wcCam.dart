import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/pages/addproduct.dart';
import 'package:warecheap/widgets/wcVoidWidget.dart';
import 'package:warecheap/models/wcImageModel.dart';

// class wcCam extends StatefulWidget {
//   const wcCam({Key? key}) : super(key: key);
//   @override
//   _wcCamState createState() => _wcCamState();
// }

class wcCamState {
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  BuildContext? context;

  wcCamState(BuildContext context) {
    this.context = context;
  }

  // Future<void> initializeData() async {
  //   try {
  //     _getPhoto();
  //     print(imageFile!.path);
  //   } catch (e) {
  //     print(e);
  //     //Navigator.pop(context);
  //   }
  // }

  // @override
  // initState() {
  //   super.initState();
  //   initializeData();
  // }

  // @override
  // dispose() {
  //   super.dispose();
  // }

  void getPhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    final cameras = await availableCameras();
    if (!cameras.isEmpty) {
      if (photo != null) {
        imageFile = File(photo.path);
        print("Photo is not null");
        Navigator.of(context!).push(_createAddProductRoute(this.imageFile));
      } else {
        //Navigator.push(Browse())
      }
    }
  }

  Route _createAddProductRoute(File? image) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ChangeNotifierProvider(
              create: (context) => ImageModel(
                    imageFile: image,
                  ),
              child: AddProduct(imgDir: image!.path)),
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
