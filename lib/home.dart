import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/storereview.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSigninPro>(context, listen: false);
              provider.Logout(context);
            },
          )
        ],
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            const Text('Lowest Prices Near You!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 100),
            const Text('Recent Discussions:',
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
                  child: Text('Discussion 1:',
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 139, 204, 141),
                          fontSize: 24)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => reviewStore()),
                    );
                  },
                  child: Text('Discussion 2:',
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 139, 204, 141),
                          fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
