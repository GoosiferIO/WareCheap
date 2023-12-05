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

Future<void> main() async {
  await uploadFile('', '');
  await dotenv.load();
}

Future<void> uploadFile(String dir, String fileName) async {
  String filePath = "assets$dir/$fileName";
  const String region = "";
  String? baseHostname = dotenv.env['baseHostname'];
  String hostname = region.isEmpty ? baseHostname! : "$region.$baseHostname";
  String? storageZoneName = dotenv.env['storageZoneName'];
  String fileNameToUpload = fileName;
  String? accessKey = dotenv.env['bunnyAccessKey'];
  String? contentType = dotenv.env["application/octet-stream"];

  String url = "https://$hostname/$storageZoneName$dir/$fileNameToUpload";

  // assets loaded through rootBundle.load
  ByteData data = await rootBundle.load(filePath);
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
