import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("Placeholder"), fit:BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(constraints: BoxConstraints(maxWidth:150, maxHeight: 150),
                  child:Image.asset("Assets/UPM_LOGO.png", fit: BoxFit.contain),
                  ),
                  
                ],
              ),


              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("FSKTM NAVIGATION APP TEST"),
                ],
              ),

              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Navigate . Explore . Go Green"),
                ],
              ),

              SizedBox(height: 300,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Developed By Group 3")
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mobile App Development")
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Row 4: Placeholder for Loading Animation")
                ],
              )

            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Test"),
      ),
    ),
    
  );
  }
}