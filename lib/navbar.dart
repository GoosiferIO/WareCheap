import 'package:flutter/material.dart';

@override
Widget navBar(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('Name here'),
          accountEmail: const Text('Email here'),
          currentAccountPicture: CircleAvatar(
              //child: ClipOval(child: Image.asset('image here')),
              ),
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
        ),
        ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/first', (route) => false);
            }),
        const Divider(), //wasnt const
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Page1'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/second', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Page2'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/third', (route) => false);
          },
        ),
      ],
    ),
  );
}
