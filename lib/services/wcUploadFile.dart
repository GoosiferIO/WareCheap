// ignore_for_file: prefer_single_quotes, file_names

/*
This class contains the the uploadFile function, which is used to upload files
to BunnyCDN. This code is based on the example code provided by 
https://docs.bunny.net/reference/put_-storagezonename-path-filename.

*/

import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String urlify(String url) {
  return Uri.encodeFull(url);
}

Future<void> main() async {
  await uploadFile('', '');
  await dotenv.load(fileName: 'serviceKeys.env');
}

Future<void> uploadFile(String dir, String fileName) async {
  String filePath = "$dir";
  const String region = "";
  String? baseHostname = dotenv.env['baseHostname'];
  String hostname = region.isEmpty ? baseHostname! : "$region.$baseHostname";
  String? storageZoneName = dotenv.env['storageZoneName'];
  String fileNameToUpload = fileName;
  String? accessKey = dotenv.env['bunnyAccessKey'];
  String? contentType = dotenv.env["contentType"];

  String url =
      "https://$hostname/$storageZoneName/warecheap/wcProducts/$fileNameToUpload";

  // assets loaded through rootBundle.load
  File file = File(filePath);
  Uint8List bytes = await file.readAsBytes();
  ByteData data = ByteData.sublistView(bytes);
  List<int> fileBytes = data.buffer.asUint8List();

  var request = http.Request('PUT', Uri.parse(url));
  request.headers.addAll({
    'Content-Type': contentType!,
    'AccessKey': accessKey!,
  });

  request.bodyBytes = fileBytes;

  var response = await http.Client().send(request);
  var responseString = await utf8.decodeStream(response.stream);

  // ignore: avoid_print
  print(responseString);
}

String getGroceryPicture(String fileName) {
  return "https://cdn.goosifer.io/warecheap/wcProducts/$fileName";
}
