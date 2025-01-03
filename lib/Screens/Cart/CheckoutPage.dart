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
      backgroundColor: Color(0xFFC9E6F0),
      appBar: AppBar(title: Text("Checkout",style: TextStyle(color: Colors.cyanAccent)), backgroundColor: Color(0xFF213555)),
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/products/panjabi.png", height: 50,width: 50,fit: BoxFit.cover)
                      ),
                      title: Text("Panjabi", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Size: M"),
                      trailing: Text("\$123", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 20),
                Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: Text(_address),
                    trailing: IconButton(
                      icon: Icon(Icons.edit,color: Colors.indigo,),
                      onPressed: () => _editAddress(context),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Total Price: \$$_totalPrice",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
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
                  subtitle: Text("Delivered by Monday, November 28"),
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
                  subtitle: Text("Delivered by Wednesday, November 23"),
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
                  subtitle: Text("Delivered by Tuesday, November 22"),
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
                  leading: Icon(Icons.credit_card,color: Colors.blue),
                  title: Text("Credit Card"),
                  trailing: Icon(Icons.radio_button_off),
                ),
                ListTile(
                  leading: Icon(Icons.money,color: Colors.red),
                  title: Text("Cash on Delivery"),
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                ),
                ListTile(
                  leading: Icon(Icons.apartment,color: Colors.brown),
                  title: Text("Bank Account"),
                  trailing: Icon(Icons.radio_button_off),
                ),
                ListTile(
                  leading: Icon(Icons.mobile_friendly),
                  title: Text("Mobile Banking"),
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
