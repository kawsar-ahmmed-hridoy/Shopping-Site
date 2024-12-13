import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;

  ProductItem({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(price),
      trailing: Icon(Icons.favorite_border),
    );
  }
}
