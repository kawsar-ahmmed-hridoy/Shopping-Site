import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CartPage.dart';
import 'package:shopping_site/Screens/Favorite/SaveItemPage.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';
import 'package:shopping_site/Screens/Search/SearchPage.dart';
import 'package:shopping_site/Screens/Signup/SigninScreen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("Account", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              /*pore kora lagbe*/
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
                radius: 40,
                backgroundImage: AssetImage('assets/additionals/hridoy.jpg'),
              ),
              SizedBox(height: 10),
              Text("Kawsar Ahmmed Hridoy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
            ],
          ),
          _buildListTile(context, Icons.shopping_bag, "My Order", () {}),
          _buildListTile(context, Icons.delivery_dining, "Premier Delivery", () {}),
          _buildListTile(context, Icons.person, "My Details", () {}),
          _buildListTile(context, Icons.location_on, "Address Book", () {}),
          _buildListTile(context, Icons.payment, "Payment Methods", () {}),
          _buildListTile(context, Icons.notifications, "Contact Preferences", () {}),
          _buildListTile(context, Icons.share, "Social Accounts", () {}), Divider(),
          _buildListTile(context, Icons.card_giftcard, "Gift Cards & Voucher", () {}),
          _buildListTile(context, Icons.help_outline, "Need Help?", () {}),
          _buildListTile(context, Icons.feedback, "Tell Us What You Think", () {}),
          _buildListTile(context, Icons.logout, "Sign Out", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          }),
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
          } if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          } if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          } if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SaveItemPage()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
