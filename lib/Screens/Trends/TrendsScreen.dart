import 'package:flutter/material.dart';
import 'ProductItem.dart';

class TrendsScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'title': 'Handbag', 'price': '\$225'},
    {'title': 'Dress', 'price': '\$87'},
    {'title': 'Shoes', 'price': '\$201'},
    {'title': 'T-shirt', 'price': '\$86'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Trend'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            title: products[index]['title']!,
            price: products[index]['price']!,
          );
        },
      ),
    );
  }
}
