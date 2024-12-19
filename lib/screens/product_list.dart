import 'package:flutter/material.dart';

import '../widgets/product_list_row.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: buildProductListPage(context),
    );
  }

  buildProductListPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
//filter
              return buildFilterWidgets(screenSize);
            } else if (index == 4) {
//footer
              return Text("Footer");
            } else {
//products
              return buildProductListRow();
            }
          }),
    );
  }

  buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          child: Row(
            children: <Widget>[
              buildFilterButton("Order"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              buildFilterButton("Filter"),
            ],
          ),
        ),
      ),
    );
  }

  buildFilterButton(String title) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  buildProductListRow() {
    return ProductListRow(
        name: "Sweatshirt",
        currentPrice: 700.0,
        originalPrice: 1000.0,
        discount: 30,
        imageUrl: "https://img.freepik.com/free-vector/townhouse-buildings-isometric-composition-with-view-building-site-crane-residential-dwelling-house-construction_1284-31619.jpg");
  }
}
