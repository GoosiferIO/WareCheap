// ignore_for_file: camel_case_types, prefer_const_constructors
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';

class reviewItem extends StatelessWidget {
  const reviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    String _formatTimestamp(Timestamp timestamp) {
      DateTime dateTime = timestamp.toDate();
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    }

    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Review for Items',
      bodyContext: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Enter Review'),
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm(firestore, _textEditingController.text);
                _textEditingController.clear();
              },
              child: const Text('Submit Review'),
            ),
            SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('ItemReviews').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var document = snapshot.data!.docs[index];
                        var data = document.data() as Map<String, dynamic>;
                        var createdAt = data['createdAt'] as Timestamp?;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      data['user']['photoURL'] ?? ''),
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data['user']['displayName'] ??
                                                'No Name',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            createdAt != null
                                                ? _formatTimestamp(createdAt)
                                                : 'No timestamp',
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        data['text'],
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm(FirebaseFirestore firestore, String inputData) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      firestore.collection('users').doc(currentUser.uid).get().then((userDoc) {
        if (userDoc.exists) {
          var userData = userDoc.data();
          var displayName = userData?['displayName'];
          var email = userData?['email'];
          var photoURL = userData?['photoURL'];

          firestore.collection('ItemReviews').add({
            'text': inputData,
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
}