import 'package:flutter/material.dart';
import 'package:flutter_food/constants/foodList.dart';
import 'package:flutter_food/screens/detail.dart';

class Bill extends StatelessWidget {
  final String id;
  final int itemCount;

  Bill({@required this.id, @required this.itemCount});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.25;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DetailScreen(
                    id: id,
                    imgUrl: foodList[this.id]['url'],
                    price: foodList[this.id]['price'],
                    itemCount: this.itemCount ?? 0,
                    title: foodList[this.id]['name'],
                    calorie: foodList[this.id]['calorie'],
                    carb: foodList[this.id]['carb'],
                    type: foodList[this.id]['type'],
                    protein: foodList[this.id]['protein'],
                  );
                },
              ),
            );
          },
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(foodList[this.id]['url']),
                  width: width,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    foodList[this.id]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'X ${this.itemCount.toString()}',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.56),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Total: \$ ${foodList[this.id]['price'] * this.itemCount}',
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
