import 'package:flutter/material.dart';
import 'package:drawertest/home.dart';
import 'package:drawertest/page1.dart';
import 'package:drawertest/page2.dart';

void main() {
  runApp(MaterialApp(
    title: 'Test Drawer',
    initialRoute: '/first',
    routes: {
      '/first': (context) => const Home(),
      '/second': (context) => const Page1(),
      '/third': (context) => const Page2(),
    },
  ));
}
