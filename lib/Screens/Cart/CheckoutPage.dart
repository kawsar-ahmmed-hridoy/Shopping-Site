import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentStep = 0;
  String _shippingOption = "Free Standard Shipping";
  String _address = "Gopalpur, Tangail, Dhaka, Bangladesh\nContact: 01714440146";
  int _totalPrice = 123;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"), backgroundColor: Colors.white,),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {setState(() {_currentStep += 1;});
          } else {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order placed successfully!")),);Navigator.pop(context);}
        },
        onStepCancel: () {
          if (_currentStep > 0) {setState(() {_currentStep -= 1;});}
        },
        steps: [
          Step(
            title: Text("Information", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                ListTile(
                  leading: Image.network(
                    "assets/products/tshirt.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text("Men\'s t-shirt"),
                  subtitle: Text("Size: M"),
                  trailing: Text("\$123"),
                ),
                Divider(),
                SizedBox(height: 20),
                Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: Text(_address),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editAddress(context),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Total Price: \$$_totalPrice",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text("Shipping", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shipping Options", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                RadioListTile(
                  value: "Free Standard Shipping",
                  groupValue: _shippingOption,
                  onChanged: (value) {
                    setState(() {
                      _shippingOption = value!;
                    });
                  },
                  title: Text("Free Standard Shipping"),
                  subtitle: Text("Delivered by Monday, June 8"),
                ),
                RadioListTile(
                  value: "Express Shipping",
                  groupValue: _shippingOption,
                  onChanged: (value) {
                    setState(() {
                      _shippingOption = value!;
                    });
                  },
                  title: Text("\$10.00 Express Shipping"),
                  subtitle: Text("Delivered by Wednesday, June 3"),
                ),
                RadioListTile(
                  value: "Premium Shipping",
                  groupValue: _shippingOption,
                  onChanged: (value) {
                    setState(() {
                      _shippingOption = value!;
                    });
                  },
                  title: Text("\$19.99 Premium Shipping"),
                  subtitle: Text("Delivered by Tuesday, June 2"),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text("Payment", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text("Credit Card"),
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Cash on Delivery"),
                  trailing: Icon(Icons.radio_button_off),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

  void _editAddress(BuildContext context) {
    TextEditingController addressController = TextEditingController(text: _address);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Address"),
        content: TextField(
          controller: addressController,
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Shipping Address",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _address = addressController.text;
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
