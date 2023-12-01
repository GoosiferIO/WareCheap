import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:warecheap/wcCore.dart';
import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  const Browse({Key? key});

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context,
      'Browse',
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: const Text(
                    'Add New Ware',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                  child: const Text(
                    'Visit Forum',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                      setState(() {
                        _selectedSegment = value!;
                      });
                    },
                    groupValue: _selectedSegment,
                  ),
                ),
              ),
            ],
          ),
          // Show the current selection
          Text('Current Selection: $_selectedSegment'),
        ],
      ),
    );
  }
}
