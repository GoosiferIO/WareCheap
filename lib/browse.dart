import 'package:flutter/material.dart';
import 'package:warecheap/wcCore.dart';
import 'package:flutter/material.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context)  {
    return wcCore.coreUI(context, 'Browse', Column(
          children: <Widget> [
            Row(
              children: <Widget> [
                Text('Browse lowest prices near you'),
                TextField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ]
            )
          ],
        ));
      }
    
  }