import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productcatalog/ui/catalog_page.dart';
import 'package:productcatalog/ui/widget/background.dart';
import 'package:productcatalog/ui/widget/header.dart';
import 'package:productcatalog/ui/widget/menuitem.dart';

class MainPage extends StatelessWidget {
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Background(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }

  Future _getThingsOnStartUp() async {
    await Future.delayed(Duration(seconds: 1));
  }

  Size deviceSize;
  Widget appBarColumn(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
      child: new Header(
        title: "Hi, Reviewer Dicoding",
        subtitle: "Welcome to my product catalog",
        textColor: Colors.white,
      ),
    ),
  );

  Widget searchCard(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatalogPage(keyword: value, minPrice: "10000",)));
                  },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find a product",
                    suffixIcon: IconButton(
                    onPressed: () => _controller.clear(),
                      icon: Icon(Icons.clear),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget profileCard() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListTile(
          leading: myProfilePicture(),
          title: Text(
            "Ari Fajrianda Alfi",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              "real.rezz@gmail.com",
            style: GoogleFonts.montserrat(),
          ),
        )
      ),
    ),
  );

  Widget menuCard(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: deviceSize.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatalogPage(keyword: "redmi", minPrice: "2000000",)));
                },
                child: MenuItem(
                  title: "Xiaomi",
                  bgColor: Colors.redAccent,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatalogPage(keyword: "iphone", minPrice: "8000000",)));
                },
                child: MenuItem(
                  title: "iPhone",
                  bgColor: Colors.red,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatalogPage(keyword: "samsung", minPrice: "3000000",)));
                },
                child: MenuItem(
                  title: "Samsung",
                  bgColor: Colors.deepOrangeAccent,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CatalogPage(keyword: "huawei", minPrice: "2000000",)));
                },
                child: MenuItem(
                  title: "Huawei",
                  bgColor: Colors.deepOrange,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );

  Widget allCards(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: <Widget>[
        appBarColumn(context),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        searchCard(context),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        menuCard(context),
        SizedBox(
          height: deviceSize.height * 0.1,
        ),
        Text(
          "Created by",
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold),
        ),
        profileCard(),
      ],
    ),
  );

  Widget myProfilePicture() {
    final String imageUrl = "https://d17ivq9b7rppb3.cloudfront.net/small/avatar/2018101214044263fe5bf2134476ee2af52004ecec8382.jpg";
    return new ClipRRect(
      borderRadius: BorderRadius.circular(10000.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 60,
        ),
        height: 60,
      ),
    );
  }
}