// ignore_for_file: prefer_adjacent_string_concatenation,
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:warecheap/pages/itemreview.dart';
import 'package:warecheap/pages/storereview.dart';
import 'package:warecheap/widgets/wcCore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Home',
      bodyContext: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Reduce the gap between image and text
              SizedBox(
                width: 350,
                height: 178,
                child: Image.asset(
                  'assets/wcLogo.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: wcColors.bgTertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  GroceryAppText.groceryAppText,
                  style: TextStyle(
                    fontSize: 15,
                    color: wcColors.primaryText,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Forum Discussions:',
                  style: TextStyle(fontSize: 24, color: wcColors.primaryText)),
              const SizedBox(height: 10),
              Column(
                //Price of items
                children: <Widget>[
                  TextButton.icon(
                    icon: Icon(Icons.store, color: wcColors.primaryText),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        wcColors.bgPrimaryAccent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const reviewStore()),
                      );
                    },
                    label: const Text('Leave a review for a store.'),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    icon:
                        Icon(Icons.edit_document, color: wcColors.primaryText),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        wcColors.bgPrimaryAccent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const reviewItem()),
                      );
                    },
                    label: const Text('Leave a review for an item.'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroceryAppText {
  static const String groceryAppText =
      '     Introducing an interactive grocery app revolutionizing shopping: ' +
          'report and find the best prices, create wishlists, and join ' +
          'a vibrant community forum to share reviews and tips on local ' +
          'ingredients and stores. Say goodbye to guesswork and ' +
          'hello to savings while connecting with fellow foodies!';
}

TextStyle myTextStyle = const TextStyle(
    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

// Usage in the widget:
