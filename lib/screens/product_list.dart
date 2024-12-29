import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      backgroundColor: Colors.white,
    );
  }

  buildProductListPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: getProductList(),  // Firestore'dan verileri çekiyoruz
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Yükleniyor simgesi
          } else if (snapshot.hasError) {
            return Center(child: Text("Bir hata oluştu"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Ürün bulunamadı"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length + 2,  // +2, birinci ve sonuncu satırlar için
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Filtre kısmı
                  return buildFilterWidgets(screenSize);
                } else if (index == snapshot.data!.length + 1) {
                  // Footer kısmı
                  return SizedBox(
                    height: 10.0,
                  );
                } else {
                  // Ürünleri listele
                  var product = snapshot.data![index - 1]; // +1 çünkü ilk satır filter
                  return ProductListRow(
                    name: product['name'],
                    currentPrice: product['currentPrice'],
                    originalPrice: product['originalPrice'],
                    discount: product['discount'],
                    imageUrl: product['imageUrl'],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      onTap: () {
        if (title == "Order") {
          print("sıralandı.");
        } else {
          print("filtrelendi");
        }
      },
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
}
Future<List<Map<String, dynamic>>> getProductList() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot snapshot = await firestore.collection('ecommerce').get();

  List<Map<String, dynamic>> productList = snapshot.docs.map((doc) {
    return {
      'name': doc['name'],
      'currentPrice': (doc['currentPrice'] as num).toDouble(),  // Dönüşüm yapıyoruz
      'originalPrice': (doc['originalPrice'] as num).toDouble(),  // Dönüşüm yapıyoruz
      'discount': doc['discount'] as int,  // Burada int olduğu için değiştirmeye gerek yok
      'imageUrl': doc['imageUrl'],
    };
  }).toList();

  return productList;
}
