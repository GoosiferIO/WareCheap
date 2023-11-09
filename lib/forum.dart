import 'package:flutter/material.dart';
import 'package:warecheap/navbar.dart';

class Forum extends StatelessWidget {
  const Forum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'WareCheap',
          style: TextStyle(height: 1, fontSize: 30, color: Colors.white),
        )),
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
