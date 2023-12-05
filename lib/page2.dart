import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warecheap/interface/wcCore.dart';

class Page2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Page2({Key? key});

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Authors',
      bodyContext: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.solidUserCircle,
                    size: 50,
                    color: Colors.black, // Change color as needed
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Authors Page',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // Add information about authors here
              // Example: List of author names
              Text(
                'Nathan Mortell\nEric Galvan\nAlexander Rosete',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
