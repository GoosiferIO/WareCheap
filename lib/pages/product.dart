import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';
import 'package:intl/intl.dart';
import 'package:warecheap/widgets/wcTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProductPage extends StatefulWidget {
  final wcProduct? product;

  const ProductPage({Key? key, this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _productReviewController =
      TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //final productsSnapshot = await FirebaseFirestore.instance.collection('products').get();

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      enableDrawer: true,
      context: context,
      bodyContext: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  '${widget.product!.name!}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: wcColors.primaryText,
                  ),
                ),
              ),
              //--- Product Image ---

              //--- Product Details ---
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    /* this actually isn't needed, but here for testing. set to 
                           NeverScrollableScrollPhysics() to disable scrolling */
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Column(
                        children: [
                          const SizedBox(height: 16.0),
                          Container(
                            decoration: BoxDecoration(
                              color: wcColors.bgTertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 300,
                            width: double.infinity,
                            child: Image.network(
                              widget.product!.image!,
                              width: double.infinity,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  'assets/placeholder.png',
                                  width: 100,
                                  height: 100,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          //--- Product Name ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text('Product Name: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(widget.product!.name!,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                          const SizedBox(height: 16.0),
                          //--- Product Price ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text('Price: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "\$${widget.product!.price!.toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                          const SizedBox(height: 16.0),
                          //--- Product Store ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text('Location: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(widget.product!.store!,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                          const SizedBox(height: 16.0),
                          //--- Product Department ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text('Department: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(widget.product!.dept!,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                          const SizedBox(height: 16.0),
                          //--- Product Date Published ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  const Text('Published: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      DateFormat('MMM d, yyyy')
                                          .format(widget.product!.date!),
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                          const SizedBox(height: 16.0),
                          //--- Product Reviews ---
                          Text(
                            '${widget.product!.name!} Discussions',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: wcColors.primaryText,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          wcTextField.tField(
                            controller: _productReviewController,
                            icon: const Icon(Icons.text_fields,
                                color: wcColors.linkText),
                            label: 'Enter Review',
                            hint: 'Enter Review',
                          ),
                          const SizedBox(height: 16),
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
                              _submitForm(
                                  firestore,
                                  _productReviewController.text,
                                  widget.product!.id!);
                              _productReviewController.clear();
                            },
                            label: const Text('Submit Review'),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: wcColors.bgTertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: firestore
                                  .collection('ItemReviews')
                                  .where('productId',
                                      isEqualTo: (widget.product!.id) ?? '0')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (widget.product!.id == null) {
                                  return const Text('No reviews found');
                                } else if (snapshot.hasData) {
                                  print(snapshot.data!.docs.length);
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var document = snapshot.data!.docs[index];
                                      var data = document.data()
                                          as Map<String, dynamic>;
                                      var createdAt =
                                          data['createdAt'] as Timestamp?;

                                      return Card(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16.0),
                                        elevation: 2.0,
                                        color: wcColors.bgSecondary,
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    data['user']['photoURL'] ??
                                                        ''),
                                              ),
                                              const SizedBox(width: 12.0),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          data['user'][
                                                                  'displayName'] ??
                                                              'No Name',
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: wcColors
                                                                  .primaryText),
                                                        ),
                                                        Text(
                                                          createdAt != null
                                                              ? _formatTimestamp(
                                                                  createdAt)
                                                              : 'No timestamp',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    Text(
                                                      data['text'],
                                                      style: const TextStyle(
                                                          fontSize: 16.0,
                                                          color: wcColors
                                                              .primaryText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        ], // Column children
                      ),
                    ]),
              ),
            ], // Column children
          ),
        ),
      ),
    ); // CoreUI Scaffold
  } // return build

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  void _submitForm(
      FirebaseFirestore firestore, String inputData, String productId) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      firestore.collection('users').doc(currentUser.uid).get().then((userDoc) {
        if (userDoc.exists) {
          var userData = userDoc.data();
          var displayName = userData?['displayName'];
          var email = userData?['email'];
          var photoURL = userData?['photoURL'];

          // Use 'doc(productId)' to explicitly set the document ID
          firestore.collection('ItemReviews').add({
            'text': inputData,
            'productId': productId,
            'user': {
              'displayName': displayName,
              'email': email,
              'photoURL': photoURL,
            },
            'createdAt': FieldValue.serverTimestamp(),
          }).then((_) {
            if (kDebugMode) {
              print('Review saved successfully!');
            }
          }).catchError((error) {
            if (kDebugMode) {
              print('Error saving review: $error');
            }
          });
        } else {
          if (kDebugMode) {
            print('User document does not exist!');
          }
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Error getting user document: $error');
        }
      });
    }
  }
} // _ProductPageState
