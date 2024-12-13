import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Initial/360.png', height: 100),
          Text(
            'View product 360 degrees',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('You can see the product with all angles.'),
        ],
      ),
    );
  }
}