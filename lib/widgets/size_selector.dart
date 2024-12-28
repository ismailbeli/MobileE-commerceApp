import 'package:flutter/material.dart';

class SizeSelector extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return SizeSelectorState();
  }

}

class SizeSelectorState extends State{
  String selectedSize = "L";
  buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max, //rowlar köşelere dayanır.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, color: Colors.grey,),
              SizedBox(width: 12.0,),
              Text("Size: $selectedSize", style: TextStyle(color: Colors.grey),)
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Select Size", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            ListTile(
                              title: Center(child:Text("S")),
                              onTap: () {
                                setState(() {
                                  selectedSize = "S";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Center(child:Text("M")),
                              onTap: () {
                                setState(() {
                                  selectedSize = "M";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Center(child:Text("L")),
                              onTap: () {
                                setState(() {
                                  selectedSize = "L";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Center(child:Text("XL")),
                              onTap: () {
                                setState(() {
                                  selectedSize = "XL";
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Size Table", style: TextStyle(fontSize: 12.0, color: Colors.blue),),
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return buildSizeArea();
  }
}