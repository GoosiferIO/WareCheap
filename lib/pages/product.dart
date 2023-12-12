import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:warecheap/widgets/wcProducts.dart';

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
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/placeholder.png',
                      width: 100,
                      height: 100,
                    );
                  },
                ),
              ),
              Text(product!.name!),
              Text(product!.price.toString()),
              Text(product!.store!),
              Text(product!.dept!),
              Text(product!.date!.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
