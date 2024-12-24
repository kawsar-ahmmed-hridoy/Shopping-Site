import 'package:flutter/material.dart';

class RecentSearchPage extends StatelessWidget {
  final List<String> recentSearches = [
    "Nike Shoes Transparent",
    "Black Shoe Transparent"
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () {Navigator.pop(context);},),
        backgroundColor: Color(0xFF213555),
        title: Container(
          height: 45,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 4, offset: Offset(0, 3),),],),
          child: TextField(controller: _searchController, decoration: InputDecoration(hintText: "Search...", hintStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none,), prefixIcon: Icon(Icons.search, color: Colors.blue), contentPadding: EdgeInsets.symmetric(vertical: 10),), style: TextStyle(color: Colors.black), autofocus: true,),
        ), elevation: 0,
      ),
      body: ListView.builder(itemCount: recentSearches.length, itemBuilder: (context, index) {return ListTile(leading: Icon(Icons.history, color: Colors.grey), title: Text(recentSearches[index]), onTap: () {/*pore kora lagbe*/},);},),
    );
  }
}
