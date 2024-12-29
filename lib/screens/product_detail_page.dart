import 'package:flutter/material.dart';

import '../widgets/size_selector.dart';
class ProductDetailPage extends StatefulWidget {
  final String? name;
  final double? currentPrice;
  final double? originalPrice;
  final int? discount;
  final String? imageUrl;

  ProductDetailPage({
    this.name,
    this.currentPrice,
    this.originalPrice,
    this.discount,
    this.imageUrl,
  });

  @override
  State<StatefulWidget> createState() {
    return ProductDetailPageState();
  }
}

class ProductDetailPageState extends State<ProductDetailPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Sayfanın geri gitmesi
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body:

      buildProductDetails(context),
      backgroundColor: Colors.white,
      bottomNavigationBar: buildButtomNavigationBar(),
    );
  }

  buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              buildProductImages(),
              buildProductTitle(),
              SizedBox(
                height: 10.0,
              ),
              buildProductPrice(),
              SizedBox(
                height: 10.0,
              ),
              buildDivider(size),
              SizedBox(
                height: 10.0,
              ),
              buildFutherInformation(),
              SizedBox(
                height: 10.0,
              ),
              buildDivider(size),
              SizedBox(
                height: 10.0,
              ),
              SizeSelector(),
              SizedBox(
                height: 10.0,
              ),
              buidInfo(),
              SizedBox(
                height: 10.0,
              ),
              

            ],
          ),
        )
      ],
    );
  }

  buildProductImages() {
    TabController imagesController = TabController(
        length: 3,
        vsync: this); //kaydırmalı resimleri yönetiyor. vsync mobility sağlar.
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        //resimlerin olacağı çerçeve
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white, // Gölgenin rengi
              spreadRadius: 2, // Yayılma yarıçapı
              blurRadius: 5, // Bulanıklık yarıçapı
              offset: Offset(4, 4), // X ve Y ekseninde gölge kaydırması
            ),
          ],
          borderRadius: BorderRadius.circular(10.0), // Kenar yuvarlaklığı
        ),
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                        "${widget.imageUrl}"),
                    Image.network(
                        "https://pics.clipartpng.com/midle/Blue_Sweatshirt_PNG_Clip_Art-2350.png"),
                    Image.network(
                        "https://pics.clipartpng.com/midle/Green_Sweatshirt_PNG_Clip_Art-2351.png")
                  ],
                ),
                Container(
                  alignment: FractionalOffset(
                    0.5,
                    0.95,
                  ),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          widget.name ?? "Unknown Product",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text(
            "${widget.currentPrice}\u20BA",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "${widget.originalPrice}\u20BA",
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
            "\%${widget.discount} discount",
            style: TextStyle(fontSize: 12.0, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }

  buildDivider(Size size) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: size.width,
          height: 0.25,
        ),
      ],
    );
  }

  buildFutherInformation() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      children: [
        Icon(Icons.local_offer),
        SizedBox(width: 12.0),
        Text(" This ${widget.name} is 90% cotton", style: TextStyle(color: Colors.grey),),
      ],
    ),


    );
  }

  buildSizeArea() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisSize: MainAxisSize.max, //rowlar köşelere dayanır.
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.straighten, color: Colors.grey,),
            SizedBox(width: 12.0,),
            Text("Size: M", style: TextStyle(color: Colors.grey),)

          ],
        ),
        Row(
          children: [
            Text("Size Table", style: TextStyle(fontSize: 12.0, color: Colors.blue),)

          ],
        ),
      ],
    ),
    );
  }

  buidInfo() {
    TabController  tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.grey,
            controller: tabController,
            tabs: [
              Tab(
                child: Text("Product Information", style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text("Usage Information", style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
          Container(
            height: 40.0,
            child: TabBarView(controller: tabController, //tabbar açılınca gösterilecek ekran
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(padding: EdgeInsets.only(left: 16.0),
                  child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("90% Cotton, %10 Polyester", style: TextStyle(color: Colors.black,),),
                  )),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(padding: EdgeInsets.only(left: 16.0),
                      child:
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Wash at maximum 30\u00B0C", style: TextStyle(color: Colors.black,),),
                      )),
                ],
              ),


            ],
            ),
          )
        ],
      ),
    );
  }

  buildButtomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
              child: Row(
                children: [
                  Icon(Icons.list, color: Colors.white,),
                  SizedBox(width: 4 ),
                  Text("Wish List",style: TextStyle(color: Colors.white),)

                ],
              )
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white,),
                    SizedBox(width: 4 ),
                    Text("Add to Cart",style: TextStyle(color: Colors.white),)

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
