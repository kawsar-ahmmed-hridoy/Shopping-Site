import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CartPage.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';
import 'package:shopping_site/Screens/Profile/ProfilePage.dart';
import 'package:shopping_site/Screens/Search/SearchPage.dart';

class SaveItemPage extends StatefulWidget {
  @override
  _SaveItemPageState createState() => _SaveItemPageState();
}

class _SaveItemPageState extends State<SaveItemPage> {
  bool isAllItemsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context),),
        title: Text("Saved Items", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {setState(() {isAllItemsSelected = true;});},
                  child: Text("All Items", style: TextStyle(color: isAllItemsSelected ? Colors.brown : Colors.grey, fontWeight: FontWeight.bold,),),
                ),
                TextButton(
                  onPressed: () {setState(() {isAllItemsSelected = false;});
                  },
                  child: Text("Boards", style: TextStyle(color: !isAllItemsSelected ? Colors.brown : Colors.grey, fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
          ),
          Expanded(child: isAllItemsSelected ? _buildAllItemsView() : _buildBoardsView(),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 3,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          } if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          } if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
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

  Widget _buildAllItemsView() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        _buildSavedItemCard("Handbag LV", "\$225", "assets/products/handbag.png"),
        _buildSavedItemCard("Panjabi", "\$86", "assets/products/panjabi.png", color: Colors.green, size: "XL"),
        _buildSavedItemCard("T-shirt", "\$36", "assets/products/tshirt.png", color: Colors.grey, size: "M"),
      ],
    );
  }

  Widget _buildBoardsView() {
    List<Map<String, String>> boards = [
      {"title": "Vacation Style", "itemCount": "5 items"},
      {"title": "Work Outfits", "itemCount": "3 items"},
      {"title": "Casual Looks", "itemCount": "7 items"},
    ];

    if (boards.isEmpty) {
      return Center(
        child: Text("No boards yet! Create one to organize your saved items.", style: TextStyle(color: Colors.grey, fontSize: 16),),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: boards.length,
      itemBuilder: (context, index) {
        return _buildBoardCard(boards[index]["title"]!, boards[index]["itemCount"]!,);
      },
    );
  }

  Widget _buildSavedItemCard(String title, String price, String imagePath,
      {Color? color, String? size}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover,),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  if (color != null)Row(children: [Text("Color: "), CircleAvatar(backgroundColor: color, radius: 8,),],),
                  if (size != null)Padding(padding: EdgeInsets.only(top: 4.0), child: Text("Size: $size"),),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black,),),
                IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {/*pore kora lagbe*/},),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoardCard(String title, String itemCount) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        subtitle: Text(itemCount),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {/*details pore add kora lagbe*/},
      ),
    );
  }
}
