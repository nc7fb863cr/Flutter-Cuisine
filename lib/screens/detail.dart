import 'package:flutter/material.dart';
import 'package:flutter_food/components/indexRow.dart';
import 'package:flutter_food/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int price;
  final int calorie;
  final double carb;
  final double protein;
  final String type;
  final int itemCount;

  DetailScreen({
    @required this.id,
    @required this.imgUrl,
    @required this.price,
    this.title,
    this.calorie,
    this.carb,
    this.protein,
    this.type,
    this.itemCount,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int servings;

  @override
  void initState() {
    super.initState();
    if (widget.itemCount > 0) {
      servings = widget.itemCount;
    } else {
      servings = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double width = MediaQuery.of(context).size.width;

    return Observer(
      builder: (_) => SafeArea(
        top: false,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Hero(
                          tag: widget.imgUrl,
                          child: Image(
                            image: AssetImage(widget.imgUrl),
                            width: width,
                            height: width,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '\$ ${widget.price}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Material(
                                  elevation: 10,
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          disabledColor: Colors.black,
                                          icon: Icon(Icons.remove),
                                          color: Colors.white,
                                          onPressed: servings > 1
                                              ? () {
                                                  setState(() {
                                                    servings--;
                                                  });
                                                }
                                              : null,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            color: Colors.white,
                                            child: Text(
                                              servings.toString(),
                                              style: TextStyle(
                                                color: Colors.purpleAccent,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          disabledColor: Colors.black,
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                          onPressed: servings < 10
                                              ? () {
                                                  setState(() {
                                                    servings++;
                                                  });
                                                }
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Index(
                                    title: 'Protein',
                                    value: widget.protein,
                                    imgUrl: 'assets/protein.png',
                                    unit: 'g',
                                  ),
                                  Index(
                                    title: 'Carbs',
                                    value: widget.carb,
                                    imgUrl: 'assets/carbs.png',
                                    unit: 'g',
                                  ),
                                  Index(
                                    title: 'Calorie',
                                    value: widget.calorie.toDouble(),
                                    imgUrl: 'assets/calories.png',
                                    unit: 'kcal',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          //'Place Order  (${widget.price * servings})',
                          'Place Order',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      cart.update(id: widget.id, itemCount: servings);
                      Navigator.of(context).pop();
                    },
                    color: Colors.purpleAccent,
                  ),
                ),
                bottom: 20,
                width: MediaQuery.of(context).size.width * 0.8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
