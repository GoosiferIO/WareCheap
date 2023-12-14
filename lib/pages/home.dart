// ignore_for_file: prefer_adjacent_string_concatenation,
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:warecheap/pages/itemreview.dart';
import 'package:warecheap/pages/storereview.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warecheap/pages/product.dart';
import 'package:warecheap/widgets/wcProducts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Home',
      bodyContext: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: ListView(children: <Widget>[
              Column(
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
                    child: const Text(
                      GroceryAppText.groceryAppText,
                      style: TextStyle(
                        fontSize: 15,
                        color: wcColors.primaryText,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Just Added',
                      style:
                          TextStyle(fontSize: 24, color: wcColors.primaryText)),
                  Container(
                    height: 300,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: firestore
                            .collection('wcProducts')
                            .orderBy('dateAdded', descending: true)
                            .limit(5)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot product =
                                          snapshot.data!.docs[index];
                                      return Card(
                                        color: wcColors.bgCard,
                                        elevation: 2.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: Expanded(
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    product['imageDir'],
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Image.asset(
                                                        'assets/placeholder.png',
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              title: Text(product['name']),
                                              titleTextStyle: const TextStyle(
                                                color: wcColors.linkText,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              subtitle: Container(
                                                  width: 50,
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: wcColors.bgPrimary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    '\$${product['price']}',
                                                    style: const TextStyle(
                                                      color:
                                                          wcColors.primaryText,
                                                    ),
                                                  )),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductPage(
                                                            product: wcProduct(
                                                              context: context,
                                                              name: product[
                                                                  'name'],
                                                              price: product[
                                                                  'price'],
                                                              store: product[
                                                                  'storeName'],
                                                              image: product[
                                                                  'imageDir'],
                                                              dept: product[
                                                                  'department'],
                                                              date: (product[
                                                                          'dateAdded']
                                                                      as Timestamp)
                                                                  .toDate(),
                                                            ),
                                                          )),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                  const SizedBox(height: 16),
                  const Text('Recent Reviews',
                      style:
                          TextStyle(fontSize: 24, color: wcColors.primaryText)),
                  const SizedBox(height: 1),
                  const Text('Forum Discussions:',
                      style:
                          TextStyle(fontSize: 24, color: wcColors.primaryText)),
                  const SizedBox(height: 10),
                  Column(
                    //Price of items
                    children: <Widget>[
                      TextButton.icon(
                        icon: const Icon(Icons.store,
                            color: wcColors.primaryText),
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
                        icon: const Icon(Icons.edit_document,
                            color: wcColors.primaryText),
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
            ]),
          ),
        ),
      ),
    );
  }
}

class GroceryAppText {
  static const String groceryAppText =
      '     Introducing an interactive grocery app revolutionizing shopping: ' +
          'report and find the best grocery prices and join ' +
          'a vibrant community forum to share reviews and tips on local ' +
          'products and stores. Say goodbye to guesswork and ' +
          'hello to savings while connecting with fellow foodies!';
}

TextStyle myTextStyle = const TextStyle(
    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

// Usage in the widget:
