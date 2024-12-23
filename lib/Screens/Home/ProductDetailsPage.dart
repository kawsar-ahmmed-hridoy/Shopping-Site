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
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Padding(padding: const EdgeInsets.all(16.0), child: Image.asset(imagePath, height: 200, fit: BoxFit.contain,),),),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), child: Text(price, style: TextStyle(fontSize: 20, color: Colors.green),),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Size:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [_sizeBox("S"), _sizeBox("M"), _sizeBox("L"), _sizeBox("XL"), _sizeBox("XXL"),],),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Color:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [_colorBox(Colors.red), _colorBox(Colors.blue), _colorBox(Colors.grey), _colorBox(Colors.black), _colorBox(Colors.pink),],),),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text("Rating: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Icon(Icons.star_half, color: Colors.orange, size: 20),
                  Icon(Icons.star_border, color: Colors.orange, size: 20),
                  SizedBox(width: 7),
                  Text("(4.5)", style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Description:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "This is a detailed description of the product. Adding more details about the product here. This is a detailed description of the product. Adding more details about the product here. This is a detailed description of the product. Adding more details about the product here'",
                style: TextStyle(fontSize: 16),
              ),
            ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), child: Text("Reviews:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
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
                ],
              ),
            ),
          ],
        ),
      ),

      // Add to Cart Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            /*pore dekhtechi*/
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),), padding: EdgeInsets.symmetric(vertical: 16),),
          child: Text("Add to Cart", style: TextStyle(fontSize: 18,color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _sizeBox(String size) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(onTap: () {/*pore dekha lagbe*/},
        child: Container(width: 30, height: 30, alignment: Alignment.center, decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8),), child: Text(size, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),),
      ),
    );
  }

  Widget _colorBox(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(onTap: () {/*pore dekha lagbe(2)*/},
        child: Container(width: 20, height: 20, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey),),),
      ),
    );
  }
}
