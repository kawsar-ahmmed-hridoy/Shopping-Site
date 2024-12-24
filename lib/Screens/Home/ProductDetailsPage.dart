import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  ProductDetailsPage({
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(
        backgroundColor: Color(0xFF213555),
        title: Text(title,style: TextStyle(color: Colors.cyanAccent),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Image.asset(imagePath, height: 200, fit: BoxFit.contain,),),), Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),), SizedBox(height: 4.0),
                  Text(price, style: TextStyle(fontSize: 20, color: Colors.green),),
                ],
              ),
            ),
            _sectionBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      _sizeBox("S"),
                      _sizeBox("M"),
                      _sizeBox("L"),
                      _sizeBox("XL"),
                      _sizeBox("XXL"),
                    ],
                  ),
                  Text(
                    "Color:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      _colorBox(Colors.red),
                      _colorBox(Colors.blue),
                      _colorBox(Colors.grey),
                      _colorBox(Colors.black),
                      _colorBox(Colors.pink),
                    ],
                  ),
                ],
              ),
            ),
            _sectionBox(
              child: Row(
                children: [
                  Text(
                    "Rating: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star_half, color: Colors.orange, size: 20),
                  Icon(Icons.star_border, color: Colors.orange, size: 20),
                  SizedBox(width: 7),
                  Text(
                    "(4.5)",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            _sectionBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "This is a detailed description of the product. Adding more details about the product here."
                        "This is a detailed description of the product. Adding more details about the product here.\n "
                        "This is a detailed description of the product. Adding more details about the product here.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            _sectionBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reviews:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("H"),
                    ),
                    title: Text("Hridoy"),
                    subtitle: Text("Great product! Highly recommended."),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("K"),
                    ),
                    title: Text("Kawsar"),
                    subtitle: Text("Good quality but slightly overpriced."),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("B"),
                    ),
                    title: Text("Borson"),
                    subtitle: Text("Don't have enough money to buy this."),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("J"),
                    ),
                    title: Text("Jawad"),
                    subtitle: Text("Can't buy it. Nigga der eisob manay na"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            /* pore dekhbo */
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _sizeBox(String size) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {/* pore dekhbo */},
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            size,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _colorBox(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {/* pore dekhbo */},
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _sectionBox({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
