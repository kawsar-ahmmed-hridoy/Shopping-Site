import 'package:flutter/material.dart';
import 'package:shopping_site/Screens/Cart/CartPage.dart';
import 'package:shopping_site/Screens/Favorite/SaveItemPage.dart';
import 'package:shopping_site/Screens/Home/NewTrendPage.dart';
import 'package:shopping_site/Screens/Home/ProductDetailsPage.dart';
import 'package:shopping_site/Screens/Profile/ProfilePage.dart';
import 'package:shopping_site/Screens/Search/SearchPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Expanded(child:  _fullCard("NEW TREND", "assets/products/scarts.png",context),),],),
            Row(children: [Expanded(child: _recentlyViewedCard("T-shirt", "\$123", "assets/products/tshirt.png",context),), Expanded(child: _recentlyViewedCard("Handbag LV", "\$225", "assets/products/handbag.png",context),),],),
            Row(children: [Expanded(child: _recentlyViewedCard("Skirt", "\$150", "assets/products/skirt.png",context),), Expanded(child: _recentlyViewedCard("Face Coverings", "\$12", "assets/products/faceover.png",context),),],),
            Row(children: [Expanded(child:  _fullCard("POPULAR", "assets/products/hridoy.png",context),),],),

            Padding(padding: const EdgeInsets.all(12.0), child: Text("Recently Viewed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            Row(children: [Expanded(child: _recentlyViewedCard("Shoes", "\$56", "assets/products/shoes.png", context),), Expanded(child: _recentlyViewedCard("T-shirt", "\$123", "assets/products/tshirt.png", context),),],),
            const SizedBox(height: 10),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Saved items", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SaveItemPage()));}, child: Text("See all", style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold,),),),],),),
            _savedItemCard("Handbag LV", "\$225", "assets/products/handbag.png"),
            _savedItemCard("T-shirt", "\$123", "assets/products/tshirt.png"),
            const SizedBox(height: 10),

            Padding(padding: const EdgeInsets.all(12.0), child: Text("Brands you may like", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            Wrap(spacing: 8.0, runSpacing: 8.0, children: [_brandChip("Nike"), _brandChip("Adidas"), _brandChip("Vans"), _brandChip("Calvin Klein"), _brandChip("Richman"), _brandChip("Puma"), _brandChip("Fila"), _brandChip("Apex"), _brandChip("Levi's"), _brandChip("Tommy Hilfiger"), _brandChip("Bata"), _brandChip("Sailor"),],),
            const SizedBox(height: 10),

            Padding(padding: const EdgeInsets.all(12.0), child: Text("Styles based on your shopping habits", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
            Row(children: [Expanded(child: _styleCard("FORTNITE", "\$36", "assets/products/tshirt.png"),), Expanded(child: _styleCard("Shorts", "\$98", "assets/products/scarts.png"),),],),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 0,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          } if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          } if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
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


  Widget _savedItemCard(String title, String price, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ListTile(leading: Image.asset(imagePath, width: 50, height: 50), title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(price, style: TextStyle(color: Colors.black)), trailing: Icon(Icons.arrow_forward_ios, size: 16),),
    );
  }

  Widget _recentlyViewedCard(String title, String price, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(title: title, price: price, imagePath: imagePath,),),);},
      child: Card(margin: EdgeInsets.all(8.0),
        child: Column(children: [Image.asset(imagePath, height: 100, fit: BoxFit.contain), Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),), Text(price, style: TextStyle(color: Colors.black)),],),),
    );
  }


  Widget _fullCard(String title, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {if (title == "NEW TREND") {Navigator.push(context, MaterialPageRoute(builder: (context) => NewTrendPage()),);}},
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(elevation: 4, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),), child: Container(height: 150, padding: EdgeInsets.all(16),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), SizedBox(width: 50),],),
            ),
            ),
            Positioned(right: 20, top: -20, bottom: 0, child: Image.asset(imagePath, height: 160, width: 220,),),
          ],
        ),
      ),
    );
  }

  Widget _brandChip(String brandName) {
    return Chip(label: Text(brandName, style: TextStyle(color: Colors.black)), backgroundColor: Colors.white38,);
  }

  Widget _styleCard(String title, String price, String imagePath) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.contain),
          Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),), Text(price, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
