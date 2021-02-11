import 'package:flutter/material.dart';
import 'package:flutter_food/screens/detail.dart';

class Cuisine extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int price;
  final int calorie;
  final double protein;
  final double carb;
  final String type;

  Cuisine({
    @required this.id,
    this.imgUrl,
    this.title,
    this.price,
    this.calorie,
    this.carb,
    this.protein,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 10 - 15 - 15) / 2;

    return Container(
      //padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DetailScreen(
                    id: this.id,
                    title: this.title,
                    imgUrl: this.imgUrl,
                    price: this.price,
                    calorie: this.calorie,
                    carb: this.carb,
                    type: this.type,
                    protein: this.protein,
                    itemCount: 0,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Hero(
                    tag: this.imgUrl,
                    child: Image(
                      gaplessPlayback: true, // to prevent image flickering
                      image: AssetImage(this.imgUrl),
                      width: width,
                      height: width, fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$ ${this.price}',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
