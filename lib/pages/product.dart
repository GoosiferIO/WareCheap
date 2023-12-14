import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatelessWidget {
  final wcProduct? product;

  const ProductPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      enableDrawer: true,
      context: context,
      bodyContext: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  '${product!.name!}',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: wcColors.primaryText,
                  ),
                ),
              ),
              //--- Product Image ---

              //--- Product Details ---
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    /* this actually isn't needed, but here for testing. set to 
                           NeverScrollableScrollPhysics() to disable scrolling */
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(height: 16.0),
                          Container(
                            decoration: BoxDecoration(
                              color: wcColors.bgTertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 300,
                            width: double.infinity,
                            child: Image.network(
                              product!.image!,
                              width: double.infinity,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  'assets/placeholder.png',
                                  width: 100,
                                  height: 100,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16.0),
                          //--- Product Name ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Product Name: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(product!.name!,
                                      style: TextStyle(fontSize: 16)),
                                ],
                              )),
                          SizedBox(height: 16.0),
                          //--- Product Price ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Price: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "\$${product!.price!.toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: 16)),
                                ],
                              )),
                          SizedBox(height: 16.0),
                          //--- Product Store ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Location: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(product!.store!,
                                      style: TextStyle(fontSize: 16)),
                                ],
                              )),
                          SizedBox(height: 16.0),
                          //--- Product Department ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Department: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(product!.dept!,
                                      style: TextStyle(fontSize: 16)),
                                ],
                              )),
                          SizedBox(height: 16.0),
                          //--- Product Date Published ---
                          Container(
                              decoration: BoxDecoration(
                                color: wcColors.bgTertiary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Text('Published: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      DateFormat('MMM d, yyyy')
                                          .format(product!.date!),
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              )),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
