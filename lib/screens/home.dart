import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/components/genre.dart';
import 'package:flutter_food/components/card.dart';
import 'package:flutter_food/constants/foodList.dart';
import 'package:flutter_food/components/button.dart';
import 'package:flutter_food/screens/cart.dart';
import 'package:flutter_food/models/cart.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentType = 'Dessert';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    int getItemCount() {
      int count = 0;
      cart.cart.keys.map((item) => count += cart.cart[item]).toList();
      return count;
    }

    // print(getItemCount());

    return Observer(
      builder: (_) => SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            color: Colors.grey,
                            child: Image(
                              image: AssetImage('assets/avatar.png'),
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Ben Alexander',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // IconButton(
                    //     icon: Icon(
                    //       Icons.menu,
                    //       size: 30,
                    //     ),
                    //     onPressed: () {}),
                    // Badge(
                    //   child:
                    //       IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                    //   badgeContent: Text('3'),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(15),
                    //   child: (Badge(
                    //     child: IconButton(
                    //         icon: Icon(Icons.shopping_cart), onPressed: () {}),
                    //     badgeContent: Text('3'),
                    //   )),
                    // )
                    Ticker(
                      icon: Icons.shopping_cart,
                      onPress: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return CartScreen();
                            },
                          ),
                        );
                      },
                      size: 30,
                      badge: getItemCount().toString(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Genre(
              //   title: 'All',
              //   isSelected: currentType == '',
              //   onPress: () {
              //     setState(() {
              //       currentType = '';
              //     });
              //   },
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: typeList
                        .map((item) => Genre(
                              title: item,
                              isSelected: currentType == item,
                              onPress: () {
                                setState(() {
                                  currentType = item;
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //       borderSide: BorderSide(width: 1),
                        //     ),
                        //   ),
                        // ),
                        // Genre(
                        //   title: 'All',
                        // ),
                        // Cuisine(
                        //   imgUrl: 'assets/bread.jpg',
                        //   title: 'Bread',
                        //   price: '85',
                        // ),
                        Wrap(
                          children: foodList.keys.map((item) {
                            return Cuisine(
                              id: item,
                              imgUrl: foodList[item]['url'],
                              title: foodList[item]['name'],
                              price: foodList[item]['price'],
                              calorie: foodList[item]['calorie'],
                              carb: foodList[item]['carb'],
                              protein: foodList[item]['protein'],
                              type: foodList[item]['type'],
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
