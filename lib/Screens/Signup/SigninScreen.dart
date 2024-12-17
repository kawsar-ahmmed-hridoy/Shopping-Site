import 'package:flutter/material.dart';
import 'SignupScreen.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"), backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(),),),
            SizedBox(height: 16),
            TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(),),),
            SizedBox(height: 8),
            Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: Text("Forget Password?"),),),
            SizedBox(height: 16),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {/*pore kora lagbe*/},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                child: Text("Sign In", style: TextStyle(fontSize: 18, color: Colors.white,),),
              ),
            ),
            SizedBox(height: 16),
            Text("Or sign in with"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50, height: 50, child: IconButton(icon: Image.asset("assets/icons/google.png", fit: BoxFit.contain), onPressed: () {/* google er pore korbo*/},),),
                SizedBox(width: 50, height: 50, child: IconButton(icon: Image.asset("assets/icons/facebook.png", fit: BoxFit.contain), onPressed: () {/*Facebook er pore krbo*/},),),
                SizedBox(width: 50, height: 50, child: IconButton(icon: Image.asset("assets/icons/x.png", fit: BoxFit.contain), onPressed: () {/*Twitter er tao pore krbo*/},),),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not have an account?"),
                TextButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()),);},
                  child: Text("Signup!", style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
