import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:warecheap/wcCore.dart';
import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
        context,
        'Browse',
        Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 20.0),
                child: const Text(
                  'Search Wares',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                  child: CupertinoSlidingSegmentedControl(
                    children: const <int, Widget>{
                      0: Text('Recent'),
                      1: Text('By Product'),
                      2: Text('By Location'),
                    },
                    onValueChanged: (value) {
                      // Handle the value change here
                    },
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
