import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productcatalog/ui/widget/background.dart';
import 'package:productcatalog/ui/widget/header.dart';
import 'package:productcatalog/ui/widget/menuitem.dart';

class MainPage extends StatelessWidget {
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

  Widget searchCard() => Padding(
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
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Find a product"),
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

  Widget menuCard() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: deviceSize.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MenuItem(
                title: "Xiaomi",
                bgColor: Colors.redAccent,
              ),
              MenuItem(
                title: "iPhone",
                bgColor: Colors.red,
              ),
              MenuItem(
                title: "Samsung",
                bgColor: Colors.deepOrangeAccent,
              ),
              MenuItem(
                title: "Huawei",
                bgColor: Colors.deepOrange,
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
        searchCard(),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        menuCard(),
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

  CircleAvatar myProfilePicture() {
    final String imageUrl = "https://d17ivq9b7rppb3.cloudfront.net/small/avatar/2018101214044263fe5bf2134476ee2af52004ecec8382.jpg";
    return new CircleAvatar(
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