import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Signup/SignupScreen.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Initial/payment.png', height: 100),
            Text(
              'Payment is easy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Secure and fast payment options available.'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            padding: EdgeInsets.symmetric(vertical: 16), // Button height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Get Started',
            style:
            TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
