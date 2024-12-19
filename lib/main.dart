import 'package:ecommerce/screens/product_list.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
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
