import 'dart:io';
import 'package:flutter/material.dart';

class ImageModel with ChangeNotifier {
  File? imageFile;
  String? imagePath;

  ImageModel({this.imageFile, this.imagePath});

  void setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }
}
