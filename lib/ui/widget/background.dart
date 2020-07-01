import 'package:flutter/material.dart';
import 'package:productcatalog/ui/widget/clipper.dart';
import 'package:productcatalog/utils/constantdata.dart';

class Background extends StatelessWidget {
  final showIcon;
  final image;
  Background({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new Clipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: ConstantData.kitGradients,
                  )),
            ),
            showIcon
                ? new Center(
              child: SizedBox(
                  height: deviceSize.height / 8,
                  width: deviceSize.width / 2,
                  child: FlutterLogo(
                    colors: Colors.red,
                  )),
            )
                : new Container(
                width: double.infinity,
                child: image != null
                    ? Image.network(
                  image,
                  fit: BoxFit.cover,
                )
                    : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}