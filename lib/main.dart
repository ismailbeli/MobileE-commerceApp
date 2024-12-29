import 'package:ecommerce/screens/product_list.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-commerce",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }

}
