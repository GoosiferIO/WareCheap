// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/itemreview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warecheap/interface/wcCore.dart';

@override
Widget navBar(context) {
  return Drawer(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    backgroundColor: wcColors.bgTertiary,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Image.asset(
            'assets/Logo.png',
            width: 150,
            height: 100,
          ),
        ),
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
        const Divider(
          color: wcColors.borderPrimary,
        ),
        ListTile(
          leading: const Icon(Icons.set_meal),
          title: const Text('Browse'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/Browse',
              (route) => false,
            );
          },
        ),
        const Divider(
          color: wcColors.borderPrimary,
        ),
        ExpansionTile(
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text('Forum'),
          backgroundColor: wcColors.bgPrimary,
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
        const Divider(
          color: wcColors.borderPrimary,
        ),
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
        const Divider(
          color: wcColors.borderPrimary,
        ),
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
