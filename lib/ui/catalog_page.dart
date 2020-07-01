import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productcatalog/utils/constantdata.dart';

class CatalogPage extends StatefulWidget {
  final String keyword;
  final String minPrice;

  CatalogPage({this.keyword, this.minPrice});

  @override
  CatalogPageState createState() {
    return CatalogPageState();
  }
}

class CatalogPageState extends State<CatalogPage> {

  final String BASE_URL = "https://ace.tokopedia.com/search/v2.5/product?q=";
  String _minPrice = "&pmin=";
  static String additionalParam = "&pmax=25000000&wholesale=true&official=true&fshop=2&start=0&rows=50";
  List data;

  Future<String> getData() async {
    var res = await http.get(Uri.encodeFull(BASE_URL + widget.keyword +_minPrice + widget.minPrice + additionalParam), headers: { 'accept':'application/json' });
    setState(() {
      var content = json.decode(res.body);
      data = content['data'];
    });
    return 'success!';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      home: Scaffold(
          appBar: AppBar(
              title: Text('Catalog ${widget.keyword}'),
                  backgroundColor: Colors.deepOrange,
          ),
          body: data == null ? new Center(child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)
          )) : productGrid(data)
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Widget productGrid(List products) => GridView.count(
    crossAxisCount:
    MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
    shrinkWrap: true,
    children: products
        .map((product) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.yellow,
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              imageStack(product["image_uri_700"]),
              descStack(product["name"], product['stock']),
              priceStack(product["price"]),
            ],
          ),
        ),
      ),
    ))
        .toList(),
  );

  Widget imageStack(String img) => Image.network(
    img,
    fit: BoxFit.cover,
  );

  Widget descStack(String name, int stock) => Positioned(
    bottom: 0.0,
    left: 0.0,
    right: 0.0,
    child: Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                name,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                fontWeight: FontWeight.bold),
              ),
            ),
            Text("${stock.toString().substring(0,1)} pcs",
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    ),
  );

  Widget priceStack(String price) => Positioned(
    top: 0.0,
    left: 0.0,
    child: Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.account_balance_wallet,
            color: Colors.cyanAccent,
            size: 12.0,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            price,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          )
        ],
      ),
    ),
  );
}