import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final String imgUrl;
  final String value;
  final String unit;

  Index({this.imgUrl, this.value, this.unit});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Color.fromRGBO(255, 250, 240, 1.0),
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              gaplessPlayback: true,
              image: AssetImage(this.imgUrl),
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              this.unit,
              style: TextStyle(color: Colors.black.withOpacity(0.56)),
            ),
          ],
        ),
      ),
    );
  }
}
