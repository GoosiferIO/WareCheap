// ignore_for_file: prefer_adjacent_string_concatenation,
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:warecheap/itemreview.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/interface/wcCore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context,
      'Home',
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Reduce the gap between image and text
            SizedBox(
              width: 350,
              height: 130,
              child: Image.asset(
                'assets/Logo.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              GroceryAppText.groceryAppText,
              style: myTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text('Forum Discussions:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Column(
              //Price of items
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const reviewStore()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 139, 204, 141), // Change button color
                  ),
                  child: const Text('Leave a review for a store',
                      style: TextStyle(color: Colors.black, fontSize: 24)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const reviewItem()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 139, 204, 141), // Change button color
                  ),
                  child: const Text('Leave a review for an item',
                      style: TextStyle(color: Colors.black, fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryAppText {
  static const String groceryAppText =
      'Introducing an interactive grocery app revolutionizing shopping: ' +
          'report and find the best prices, create wishlists, and join ' +
          'a vibrant community forum to share reviews and tips on local ' +
          'ingredients and stores. Say goodbye to guesswork and ' +
          'hello to savings while connecting with fellow foodies!';
}

TextStyle myTextStyle = const TextStyle(
    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

// Usage in the widget:
