import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/wcCore.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(context, 'Home', Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Reduce the gap between image and text
            SizedBox(
              width: 350,
              height: 130,
              child: Image.asset(
                'assets/Logo.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lowest Prices Near You!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Add space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  //Names of items
                  children: <Widget>[
                    Text('Item 1:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            fontSize: 24)),
                    SizedBox(height: 10),
                    Text('Item 2:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            fontSize: 24)),
                    SizedBox(height: 10),
                    Text('Item 3:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            fontSize: 24)),
                  ],
                ),
                Column(
                  //Price of items
                  children: <Widget>[
                    Text('Price 1:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            color: Colors.red,
                            fontSize: 24)),
                    SizedBox(height: 10),
                    Text('Price 2:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            color: Colors.red,
                            fontSize: 24)),
                    SizedBox(height: 10),
                    Text('Price 3:',
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 139, 204, 141),
                            color: Colors.red,
                            fontSize: 24)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text('Forum Discussions:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Column(
              //Price of items
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => reviewStore()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 139, 204, 141), // Change button color
                  ),
                  child: const Text('Leave a review for a store',
                      style: TextStyle(color: Colors.black, fontSize: 24)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => reviewStore()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 139, 204, 141), // Change button color
                  ),
                  child: const Text('Leave a review for an item',
                      style: TextStyle(color: Colors.black, fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
