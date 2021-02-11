import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/functions/calculateIndex.dart';
import 'package:flutter_food/screens/checkout.dart';
import 'package:flutter_food/models/cart.dart';
// import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_food/components/bill.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_food/functions/getTotal.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    //autorun((_) => print(cart.cart));

    return Observer(
      builder: (_) => SafeArea(
        top: false,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 25, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Shopping Cart',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: cart.cart.keys
                        .map((item) => Bill(
                              id: item,
                              itemCount: cart.cart[item],
                            ))
                        .toList(),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: RaisedButton(
                        child: Text(
                          'Checkout  (\$ ${getTotal(cart.cart)})',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.purpleAccent,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return CheckoutScreen(
                                  total: getTotal(cart.cart).toString(),
                                  index: calculateIndex(cart.cart),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
