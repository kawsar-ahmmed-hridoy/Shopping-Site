import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CheckoutPage.dart';
import 'package:shopping_site/Screens/Cart/OrdersPage.dart';
import 'package:shopping_site/Screens/Favorite/SaveItemPage.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';
import 'package:shopping_site/Screens/Profile/ProfilePage.dart';
import 'package:shopping_site/Screens/Search/SearchPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {"title": "Panjabi", "price": 123, "image": "assets/products/panjabi.png", "quantity": 1, "color": "Red", "size": "M",},
    {"title": "T-shirt", "price": 109, "image": "assets/products/tshirt.png", "quantity": 1, "color": "Blue", "size": "L",},
  ];

  void _increaseQuantity(int index) {
    setState(() {cartItems[index]["quantity"]++;});
  }

  void _decreaseQuantity(int index) {
    setState(() {if (cartItems[index]["quantity"] > 1) {cartItems[index]["quantity"]--;}});
  }

  void _removeFromCart(int index) {
    setState(() {cartItems.removeAt(index);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(title: Text("Cart",style: TextStyle(color: Colors.cyanAccent)), backgroundColor: Color(0xFF213555),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(item["image"], width: 50, height: 50),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["title"], style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 4),
                              Text("Color: ${item["color"]}, Size: ${item["size"]}"), SizedBox(height: 4), Text("\$${item["price"]}"),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => _removeFromCart(index),),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, color: Colors.red),
                                    onPressed: () => _decreaseQuantity(index),
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                  ),
                                  Text('${item['quantity']}', style: TextStyle(fontSize: 16)),
                                  IconButton(
                                    icon: Icon(Icons.add, color: Colors.green),
                                    onPressed: () => _increaseQuantity(index),
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.vertical(top: Radius.circular(16)),),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black)),
                    Text("\$${cartItems.fold<int>(0, (sum, item) => sum + ((item["price"] as int) * (item["quantity"] as int)))}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red),),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text("Proceed to Checkout", style: TextStyle(fontSize: 16, color: Colors.white,)),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()),);
                  },
                  child: Text("View Orders", style: TextStyle(fontSize: 16, color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          } if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          } if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SaveItemPage()));
          }
        },
        items: [
          BottomNavigationBarItem(backgroundColor: Color(0xFF213555), icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF213555), icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF213555), icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF213555), icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF213555), icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
