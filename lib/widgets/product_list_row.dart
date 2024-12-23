
import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_page.dart';

class ProductListRow extends StatelessWidget {
  String? name;
  double? currentPrice;
  double? originalPrice;
  int? discount;
  String? imageUrl;

  ProductListRow({this.name, this.currentPrice, this.originalPrice, this.discount, this.imageUrl});

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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            name: name,
            currentPrice: currentPrice,
            originalPrice: originalPrice,
            discount: discount,
            imageUrl: imageUrl,
          ),
        ));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl ?? ""),
              height: 180.0,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    this.name ?? "",
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "$currentPrice\u20BA",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "$originalPrice\u20BA",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "\%$discount",
                        style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
