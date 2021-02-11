import 'package:flutter/material.dart';
import 'package:flutter_food/components/indexColumn.dart';
import 'package:flutter_food/models/cart.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  final String total;
  final Map<String, double> index;

  CheckoutScreen({this.total, this.index});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/cooking.jpg',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                ),
                Text(
                  'Your meal is almost ready!',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Color.fromRGBO(255, 235, 205, 1.0),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '\$ ${this.total}',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 22,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Index(
                                imgUrl: 'assets/calories.png',
                                value: index['calorie'].toStringAsFixed(1),
                                unit: 'kcal',
                              ),
                              Index(
                                imgUrl: 'assets/carbs.png',
                                value: index['carbs'].toStringAsFixed(1),
                                unit: 'g',
                              ),
                              Index(
                                imgUrl: 'assets/protein.png',
                                value: index['protein'].toStringAsFixed(1),
                                unit: 'g',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {
                    cart.clear();
                    Navigator.of(context).pop();
                  },
                  color: Colors.purpleAccent,
                  child: Text(
                    'Go To Homepage',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
