import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Initial/find_products.png', height: 100),
          Text(
            'Find products easily',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Take a photo to find similar products.'),
        ],
      ),
    );
  }
}