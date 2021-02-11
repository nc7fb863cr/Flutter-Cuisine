import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final String title;
  final String unit;
  final String imgUrl;
  final double value;

  Index({this.title, this.unit, this.imgUrl, this.value});

  @override
  Widget build(BuildContext context) {
    double iconWidth = MediaQuery.of(context).size.width * 0.15;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(this.imgUrl),
              width: iconWidth,
              height: iconWidth,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.title ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      this.value.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.56),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.unit ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
