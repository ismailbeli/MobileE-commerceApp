import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../screens/product_detail_page.dart';

class Routes{
  static final routes = <String,WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL:(BuildContext context)=>ProductDetailPage()
  };
}