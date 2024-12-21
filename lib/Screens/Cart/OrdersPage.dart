import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  final List<Map<String, dynamic>> pendingOrders = [
    {
      "title": "Women\'s Hoodie",
      "price": 123,
      "status": "Pending",
      "orderDate": "Nov 16, 2024",
    },
  ];

  final List<Map<String, dynamic>> pastOrders = [
    {
      "title": "Jeans",
      "price": 215,
      "status": "Delivered",
      "orderDate": "Nov 20, 2024",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Orders"),
          backgroundColor: Colors.brown,
          bottom: TabBar(
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
