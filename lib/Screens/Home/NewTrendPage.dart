import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CartPage.dart';

class NewTrendPage extends StatefulWidget {
  @override
  _NewTrendPageState createState() => _NewTrendPageState();
}

class _NewTrendPageState extends State<NewTrendPage> {
  List<Map<String, dynamic>> products = [
    {'name': 'Handbag LV', 'price': 225, 'image': 'assets/products/handbag.png', 'isFavorite': true},
    {'name': 'Dress', 'price': 87, 'image': 'assets/products/scarts.png', 'isFavorite': false},
    {'name': 'Shoes', 'price': 201, 'image': 'assets/products/shoes.png', 'isFavorite': false},
    {'name': 'T-shirt', 'price': 86, 'image': 'assets/products/tshirt.png', 'isFavorite': true},
    {'name': 'Handbag', 'price': 102, 'image': 'assets/products/wallet.png', 'isFavorite': false},
    {'name': 'Short', 'price': 98, 'image': 'assets/products/skirt.png', 'isFavorite': false},
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {super.initState();filteredProducts = List.from(products);}

  void sortProducts(String criteria) {
    setState(() {
      if (criteria == "Price: Low-->High") {filteredProducts.sort((a, b) => a["price"].compareTo(b["price"]));
      } else if (criteria == "Price: High-->Low") {filteredProducts.sort((a, b) => b["price"].compareTo(a["price"]));}
    });
  }

  void filterProducts(String category) {
    setState(() {
      if (category == "All") {filteredProducts = List.from(products);
      } else if (category == "Clothing") {filteredProducts = products.where((product) => product["name"].toLowerCase().contains("t-shirt") || product["name"].toLowerCase().contains("dress") || product["name"].toLowerCase().contains("short")).toList();
      } else if (category == "Accessories") {filteredProducts = products.where((product) => product["name"].toLowerCase().contains("handbag") || product["name"].toLowerCase().contains("shoes")).toList();}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(backgroundColor: Color(0xFF213555), title: Text("New Trend", style: TextStyle(color: Colors.cyanAccent),),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));},),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: [
                            ListTile(title: Text("Price: Low-->High"), onTap: () {sortProducts("Price: Low-->High");Navigator.pop(context);},),
                            ListTile(title: Text("Price: High-->Low"), onTap: () {sortProducts("Price: High-->Low");Navigator.pop(context);},),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.sort),
                  label: Text("Sort"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.grey[200],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: [
                            ListTile(title: Text("All"), onTap: () {filterProducts("All");Navigator.pop(context);},),
                            ListTile(title: Text("Clothing"), onTap: () {filterProducts("Clothing");Navigator.pop(context);},),
                            ListTile(title: Text("Accessories"), onTap: () {filterProducts("Accessories");Navigator.pop(context);},),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.filter_alt),
                  label: Text("Filter"),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.grey[200],),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.5,),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(8.0),), child: Image.asset(product["image"], fit: BoxFit.contain, width: 100,),),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,), maxLines: 1, overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 4.0),
                            Text("\$${product["price"]}", style: TextStyle(color: Colors.black54, fontSize: 12.0,),),
                            Align(alignment: Alignment.centerRight, child: IconButton(icon: Icon(product["isFavorite"] ? Icons.favorite : Icons.favorite_border, color: product["isFavorite"] ? Colors.red : Colors.grey,), onPressed: () {setState(() {product["isFavorite"] = !product["isFavorite"];});},),),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
