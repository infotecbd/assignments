import 'package:flutter/material.dart';

void main() {
  runApp(ProductListScreen());
}

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> products = ['Apple', 'Banana', 'Orange'];

  void addProduct(String product) {
    setState(() {
      products.add(product);  // New product added, UI will rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addProduct('Mango');  // Adding a new product
        },
        child: Icon(Icons.add),
      ),
    );
  }
}