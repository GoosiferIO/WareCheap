import 'dart:convert'; // to convert json to dart objects
import 'package:http/http.dart' as http; // for http reqs
import 'package:openfoodfacts/openfoodfacts.dart'; // open food facts api

// scan barcodes: test with 5449000131805 (coca cola classic)
Future<ProductResultV3> scanBarcode(String barcode) async {
  ProductQueryConfiguration config = ProductQueryConfiguration(
    barcode,
    version: ProductQueryVersion.v3,
  );
  ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);
  return product;
}

Future<String> get_product(String barcode) async {
  final response = await http.get(Uri.parse(
      'https://world.openfoodfacts.org/api/v0/product/$barcode.json'));
  if (response.statusCode == 200) {
    // if server == 200 response (ok)
    var json = jsonDecode(response.body);

    // does product exist
    if (json.containsKey('product')) {
      var product = json['product'];

      // 'product' object, does it contain 'product_name'
      if (product.containsKey('product_name')) {
        var product_name = product['product_name'];
        print('Product: $product_name');
        return product_name;
      } else {
        // else if 'product' object does not contain 'product_name'
        print('Error: Product name not found.');
        return 'Product name not found';
      }
    } else {
      // 'product' not present in the response
      print('Error: Product information not found.');
      return 'Product information not found';
    }
  } else {
    // if failed return err
    print(response.statusCode);
    return 'Failed to load product';
  }
}