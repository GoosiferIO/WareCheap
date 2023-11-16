import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/itemreview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@override
Widget navBar(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.lightGreen[900],
          child: const Text(
            'Warecheap',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          // ignore: deprecated_member_use
          leading: const FaIcon(FontAwesomeIcons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/first',
              (route) => false,
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.set_meal),
          title: const Text('Browse'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/second',
              (route) => false,
            );
          },
        ),
        const Divider(),
        ExpansionTile(
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text('Forum'),
          children: [
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.comment),
              title: const Text('Leave a review for a store'),
              onTap: () {
                // Navigate to Screen2 (View2)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewStore()),
                );
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.comment),
              title: const Text('Leave a review for an item'),
              onTap: () {
                // Navigate to Screen2 (View2)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => reviewItem()),
                );
              },
            ),
          ],
        ),
        const Divider(),
        ListTile(
          leading: const FaIcon(FontAwesomeIcons.google),
          title: const Text('Google Sign Up'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Google',
              (route) => false,
            );
          },
        ),
        const Divider(),
        ListTile(
          // ignore: deprecated_member_use
          leading: const FaIcon(FontAwesomeIcons.solidUserCircle),
          title: const Text('Profile Page'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Profile',
              (route) => false,
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const FaIcon(FontAwesomeIcons.solidIdBadge),
          title: const Text('Authors'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Author',
              (route) => false,
            );
          },
        ),
      ],
    ),
  );
}
