import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/itemreview.dart';
import 'package:warecheap/storereview.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSigninPro>(context, listen: false);
              provider.Logout(context);
            },
          )
        ],
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen1 (View1)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewItem()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 139, 204, 141), // Background color for the button
              ),
              child: const Text('Leave a review on an item.'),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen2 (View2)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewStore()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 139, 204, 141), // Background color for the button
              ),
              child: const Text('Leave a review on a store.'),
            ),
          ],
        ),
      ),
    );
  }
}
