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
  final _searchController = TextEditingController();
  String currentType = '';
  List conditions;
  List chosenList;

  @override
  void initState() {
    super.initState();
    conditions = typeList;
    conditions.insert(0, 'All');

    chosenList = foodList.keys.map((e) => e).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    int getItemCount() {
      int count = 0;
      cart.cart.keys.map((item) => count += cart.cart[item]).toList();
      return count;
    }

    Widget renderCards() {
      return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  spacing: 10,
                  runSpacing: 15,
                  children: chosenList.map(
                    (item) {
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
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Observer(
      builder: (_) => SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
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
                          width: 10,
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
                    CartButton(
                      icon: Icons.shopping_cart,
                      onPress: getItemCount() > 0
                          ? () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return CartScreen();
                                  },
                                ),
                              );
                            }
                          : null,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _searchController,
                  onChanged: (inputText) {
                    if (inputText.trim() == '') {
                      chosenList = foodList.keys.map((item) => item).toList();
                    } else {
                      chosenList = chosenList
                          .where((item) => foodList[item]['name']
                              .toLowerCase()
                              .contains(inputText.toLowerCase()))
                          .toList();
                    }
                    setState(() {});
                  },
                  autocorrect: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Search food here',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: conditions.map((item) {
                      if (item == 'All') {
                        return Genre(
                          title: 'All',
                          isSelected: currentType == '',
                          onPress: () {
                            setState(() {
                              currentType = '';
                              chosenList = foodList.keys.map((e) => e).toList();
                            });
                          },
                        );
                      } else {
                        return Genre(
                          title: item,
                          isSelected: currentType == item,
                          onPress: () {
                            setState(() {
                              currentType = item;
                              chosenList = foodList.keys
                                  .where((item) =>
                                      foodList[item]['type'] == currentType)
                                  .toList();
                            });
                          },
                        );
                      }
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              renderCards(),
            ],
          ),
        ),
      ),
    );
  }
}
