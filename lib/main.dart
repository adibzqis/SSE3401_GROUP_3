import 'package:flutter/material.dart';
import 'package:section_8_plus/screens/Home.dart';
import 'package:section_8_plus/screens/homescreen.dart';
import 'package:section_8_plus/screens/Block_Selection.dart';
void main() {
  runApp(const MyApp());                                                  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlockSelection();                        
  }
}               

