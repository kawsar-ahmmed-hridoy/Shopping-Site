import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CartPage.dart';
import 'package:shopping_site/Screens/Cart/OrdersPage.dart';
import 'package:shopping_site/Screens/Favorite/SaveItemPage.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';
import 'package:shopping_site/Screens/Search/SearchPage.dart';
import 'package:shopping_site/Screens/Signup/SigninScreen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(
        backgroundColor: Color(0xFF213555),
        elevation: 1,
        title: Text("Account", style: TextStyle(color: Colors.cyanAccent)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              /* Future Implementation */
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/additionals/hridoy.jpg'),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kawsar Ahmmed Hridoy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
            ],
          ),
          _buildListTile(context, Icons.shopping_bag, "My Order", Colors.blue, () {Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()),);}),
          _buildListTile(context, Icons.delivery_dining, "Premier Delivery", Colors.teal, () {}),
          _buildListTile(context, Icons.person, "My Details", Colors.purple, () {}),
          _buildListTile(context, Icons.location_on, "Address Book", Colors.red, () {}),
          _buildListTile(context, Icons.payment, "Payment Methods", Colors.green, () {}),
          _buildListTile(context, Icons.notifications, "Contact Preferences", Colors.orange, () {}),
          _buildListTile(context, Icons.share, "Social Accounts", Colors.indigo, () {}),
          Divider(),
          _buildListTile(context, Icons.card_giftcard, "Gift Cards & Voucher", Colors.pink, () {}),
          _buildListTile(context, Icons.help_outline, "Need Help?", Colors.brown, () {}),
          _buildListTile(context, Icons.feedback, "Tell Us What You Think", Colors.cyan, () {}),
          _buildListTile(context, Icons.logout, "Sign Out", Colors.blueAccent, () {Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()),);}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 4,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          }
          if (index == 3) {
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

  Widget _buildListTile(BuildContext context, IconData icon, String title, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
