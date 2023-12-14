// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors,
// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warecheap/pages/signin.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? currentName = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // updates the user's name in Firestore
  void _updateName(String newName) async {
    if (currentUser != null) {
      firestore.collection('users').doc(currentUser!.uid).get().then((userDoc) {
        if (userDoc.exists) {
          userDoc.reference.update({'displayName': newName});
        }
      });
    } else {
      print('User is not signed in!');
    }
  }

  Future<void> _updateCurrentName() async {
    try {
      final userDoc =
          await firestore.collection('users').doc(currentUser!.uid).get();
      if (userDoc.exists) {
        setState(() {
          userDoc.reference.update({'displayName': currentName});
        });
      }
    } catch (e) {
      // Handle any errors here
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _updateCurrentName();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    TextEditingController _usernameController = TextEditingController();

    if (user == null) {
      return SigninPage();
    }

    return wcCore.coreUI(
      scaffoldKey: _scaffoldKey,
      context: context,
      appbarTitle: 'Profile',
      bodyContext: Container(
        padding: EdgeInsets.all(20),
        color: wcColors.bgPrimary,
        child: Column(
          children: [
            Expanded(
              child: ListView(children: <Widget>[
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: wcColors.bgTertiary,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(
                          16), // Added padding for better spacing
                      child: Container(
                        padding: const EdgeInsets.all(
                            16), // Added padding for better spacing

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Profile',
                              style: TextStyle(
                                color: wcColors.primaryText,
                                fontSize: 32, // Increased font size
                              ),
                            ),
                            const SizedBox(height: 32),
                            CircleAvatar(
                              radius: 75, // Increased avatar size
                              backgroundImage:
                                  NetworkImage(user.photoURL ?? ''),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Name: ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: wcColors.secondaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 20), // Increased font size
                      ),
                    ),
                    wcTextField.tField(
                      controller: _usernameController,
                      label: '${currentName ?? 'No Name'}',
                      icon: Icon(Icons.person),
                      hint: '${currentName ?? 'No Name'}',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email: ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: wcColors.secondaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 20), // Increased font size
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: wcColors.bgTertiary,
                            elevation: 2.0,
                            child: Container(
                              margin: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(Icons.email,
                                      color: wcColors.secondaryText),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${user.email ?? 'No Email'}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 151, 151, 151),
                                        fontSize: 16), // Increased font size
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(Icons.lock,
                                      color: wcColors.bgAlert, size: 15),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                        onPressed: () {
                          if (_usernameController.text.isNotEmpty) {
                            currentName = _usernameController.text;
                            _updateName(currentName ?? 'No Name');
                            _updateCurrentName();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Profile updated! Changes will be reflected on future reviews posted.")));
                            currentName = _usernameController.text;

                            _usernameController.clear();
                          }
                        },
                        child: Text('Update Profile')),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
