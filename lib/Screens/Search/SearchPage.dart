import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  bool isMenSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: TextField(decoration: InputDecoration(hintText: "Search...", border: InputBorder.none,),), backgroundColor: Colors.white, elevation: 1, leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context),),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {setState(() {isMenSelected = true;});}, child: Text("Men", style: TextStyle(color: isMenSelected ? Colors.brown : Colors.grey, fontWeight: FontWeight.bold,),),),
              TextButton(onPressed: () {setState(() {isMenSelected = false;});}, child: Text("Women", style: TextStyle(color: isMenSelected ? Colors.grey : Colors.brown, fontWeight: FontWeight.bold,),),),
            ],
          ),
          Expanded(
            child: isMenSelected ? _menCategories() : _womenCategories(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyanAccent, unselectedItemColor: Colors.blueGrey, currentIndex: 1, showUnselectedLabels: true,
        onTap: (index) {if (index == 0) {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);}},
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

  Widget _menCategories() {
    return SingleChildScrollView(
      child: Column(children: [_categoryCard("NEW IN", "assets/products/hridoy.png"), _categoryCard("TRENDING", "assets/products/panjabi.png"), _categoryCard("CLOTHING", "assets/products/tshirt.png"), _categoryCard("SHOES", "assets/products/shoes.png"), _categoryCard("FACE COVER", "assets/products/faceover.png"), _categoryCard("ACCESSORIES", "assets/products/wallet.png"),],),
    );
  }

  Widget _womenCategories() {
    return SingleChildScrollView(
      child: Column(children: [_categoryCard("NEW IN", "assets/products/scarts.png"), _categoryCard("DRESSES", "assets/products/skirt.png"), _categoryCard("COSMETICS", "assets/products/faceover.png"), _categoryCard("SHOES", "assets/products/shoes.png"), _categoryCard("BAGS", "assets/products/handbag.png"), _categoryCard("ACCESSORIES", "assets/products/wallet.png"),],),
    );
  }

  Widget _categoryCard(String title, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(height: 150, padding: EdgeInsets.all(16), child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),],),),
          ),
          Positioned(right: 20, top: 10, bottom: 10, child: Image.asset(imagePath, height: 100, width: 100,),),
        ],
      ),
    );
  }
}
