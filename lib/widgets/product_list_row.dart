
import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget{
  String? name;
  double? currentPrice;
  double? originalPrice;
  int? discount;
  String? imageUrl;

  ProductListRow({this.name,this.currentPrice,this.originalPrice,this.discount,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildProductItemCard(context),
        buildProductItemCard(context),
      ],
    );
  }

  buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children:<Widget> [
            Container(
              child: Image.network(this.imageUrl??""),
              // Image.network(this.imageUrl)
              height: 180.0,
              width: MediaQuery.of(context).size.width/2.2,
            )
          ],
        ),
      ),
    );
  }

}