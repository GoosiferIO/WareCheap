// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warecheap/pages/storereview.dart';
import 'package:warecheap/pages/itemreview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warecheap/widgets/wcCore.dart';

@override
Widget navBar(context) {
  return Drawer(
    width: 200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    backgroundColor: wcColors.bgTertiary,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: 120,
          height: 120,
          padding: EdgeInsets.only(top: 30),
          margin: EdgeInsets.only(bottom: 10),
          child: Image.asset(
            'assets/navLogo.png',
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
          leading: Icon(Icons.local_grocery_store),
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
        Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            leading: const Icon(Icons.format_list_bulleted),
            title: const Text('Forum',
                style: TextStyle(
                    fontSize: 16,
                    color: wcColors.primaryText,
                    fontWeight: FontWeight.normal)),
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
