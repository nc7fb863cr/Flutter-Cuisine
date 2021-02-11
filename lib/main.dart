import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_food/models/cart.dart';
import 'screens/home.dart';
import 'screens/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Cart>(
          create: (_) => Cart(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olivia\'s Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)).then((value) => true),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Observer(builder: (_) => HomeScreen());
            }

            return SplashScreen();
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
