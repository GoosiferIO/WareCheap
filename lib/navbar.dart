import 'package:flutter/material.dart';

@override
Widget navBar(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        // Add the big text at the top
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.lightGreen[900], // Set the background color to blue
          child: const Text(
            'Warecheap', // Replace with your app's name
            style: TextStyle(
              fontSize: 24.0, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set the text color to white
            ),
          ),
        ),
        const Divider(),
        ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/first', (route) => false);
            }),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Browse'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/second', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Forum'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/third', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Google Sign Up'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/Google', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Profile Page'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/Profile', (route) => false);
          },
        ),
      ],
    ),
  );
}
