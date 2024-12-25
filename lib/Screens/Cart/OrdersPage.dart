import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  final List<Map<String, dynamic>> pendingOrders = [
    {
      "title": "Panjabi",
      "price": 123,
      "status": "Pending",
      "orderDate": "Nov 20, 2024",
    },
  ];

  final List<Map<String, dynamic>> pastOrders = [
    {
      "title": "Jeans",
      "price": 215,
      "status": "Delivered",
      "orderDate": "Nov 10, 2024",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFC9E6F0),
        appBar: AppBar(
          title: Text("My Orders",style: TextStyle(color: Colors.cyanAccent),),
          backgroundColor: Color(0xFF213555),
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Pending Orders"),
              Tab(text: "Past Orders"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ordersList(pendingOrders, context),
            _ordersList(pastOrders, context),
          ],
        ),
      ),
    );
  }

  Widget _ordersList(List<Map<String, dynamic>> orders, BuildContext context) {
    if (orders.isEmpty) {
      return Center(
        child: Text("No orders available", style: TextStyle(fontSize: 18)),
      );
    }
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(order["title"], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price: \$${order["price"]}"),
                Text("Status: ${order["status"]}"),
                Text("Order Date: ${order["orderDate"]}"),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}
