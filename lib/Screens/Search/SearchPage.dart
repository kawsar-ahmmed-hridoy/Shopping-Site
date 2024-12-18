import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Home/HomePage.dart';
import 'package:shopping_site/Screens/Search/RecentSearchPage.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false, title: _buildInteractiveSearchBar(context), backgroundColor: Colors.white, elevation: 0,),
      body: _buildCategoryView(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 1,
        showUnselectedLabels: true,
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

  Widget _buildInteractiveSearchBar(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(duration: Duration(milliseconds: 200), height: 45,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 4, offset: Offset(0, 3),),],),
        child: InkWell(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RecentSearchPage()),);},
          splashColor: Colors.grey.shade200,
          hoverColor: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          child: Row(children: [SizedBox(width: 10), Icon(Icons.search, color: Colors.grey), SizedBox(width: 10), Text("Search...", style: TextStyle(color: Colors.grey, fontSize: 16),),],),
        ),
      ),
    );
  }

  Widget _buildCategoryView() {
    bool isMenSelected = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {setState(() {isMenSelected = true;});}, child: Text("Men", style: TextStyle(color: isMenSelected ? Colors.brown : Colors.grey, fontWeight: FontWeight.bold,),),),
                TextButton(onPressed: () {setState(() {isMenSelected = false;});}, child: Text("Women", style: TextStyle(color: isMenSelected ? Colors.grey : Colors.brown, fontWeight: FontWeight.bold,),),),
              ],
            ),
            Expanded(child: isMenSelected ? _menCategories() : _womenCategories(),),
          ],
        );
      },
    );
  }

  Widget _menCategories() {
    return _categoryList([
      {"title": "NEW IN", "imagePath": "assets/products/hridoy.png"},
      {"title": "TRENDING", "imagePath": "assets/products/panjabi.png"},
      {"title": "CLOTHING", "imagePath": "assets/products/tshirt.png"},
      {"title": "SHOES", "imagePath": "assets/products/shoes.png"},
      {"title": "FACE COVER", "imagePath": "assets/products/faceover.png"},
      {"title": "ACCESSORIES", "imagePath": "assets/products/wallet.png"},
    ]);
  }

  Widget _womenCategories() {
    return _categoryList([
      {"title": "NEW IN", "imagePath": "assets/products/scarts.png"},
      {"title": "DRESSES", "imagePath": "assets/products/skirt.png"},
      {"title": "COSMETICS", "imagePath": "assets/products/faceover.png"},
      {"title": "SHOES", "imagePath": "assets/products/shoes.png"},
      {"title": "BAGS", "imagePath": "assets/products/handbag.png"},
      {"title": "ACCESSORIES", "imagePath": "assets/products/wallet.png"},
    ]);
  }

  Widget _categoryList(List<Map<String, String>> categories) {
    return SingleChildScrollView(child: Column(children: categories.map((category) => _categoryCard(category['title']!, category['imagePath']!)).toList(),),);
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
            child: Container(height: 150, padding: EdgeInsets.all(16), child: Align(alignment: Alignment.centerLeft, child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),),
          ),
          Positioned(right: 15, top: 10, bottom: 10, child: Image.asset(imagePath, height: 100, width: 100,),),
        ],
      ),
    );
  }
}
