import 'package:flutter/material.dart';
import 'package:warecheap/home.dart';
import 'package:warecheap/browse.dart';
import 'package:warecheap/forum.dart';

void main() {
  runApp(MaterialApp(
    title: 'Test Drawer',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      useMaterial3: true,
    ),
    initialRoute: '/first',
    routes: {
      '/first': (context) => const Home(),
      '/second': (context) => const Browse(),
      '/third': (context) => const Forum(),
    },
  ));
}
