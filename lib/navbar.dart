import 'package:flutter/material.dart';

@override
Widget navBar(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        //Container(color: Colors.lightGreen[900]),
        // UserAccountsDrawerHeader(
        //   accountName: const Text(
        //     'Name here',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   accountEmail: const Text(
        //     'Email here',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   currentAccountPicture: CircleAvatar(
        //       //child: ClipOval(child: Image.asset('image here')),
        //       ),
        //   decoration: const BoxDecoration(),
        // ),
        ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/first', (route) => false);
            }),
        //const Divider(),
        ListTile(
          title: const Text('Browse'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/second', (route) => false);
          },
        ),
        ListTile(
          title: const Text('Forum'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/third', (route) => false);
          },
        ),
      ],
    ),
  );
}
