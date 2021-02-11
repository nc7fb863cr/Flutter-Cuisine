import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class Ticker extends StatelessWidget {
  final Function onPress;
  final IconData icon;
  final double size;
  final Color color;
  final String badge;

  Ticker({
    this.onPress,
    this.icon,
    this.size,
    this.color,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Badge(
          badgeColor: Colors.purpleAccent,
          badgeContent: Text(
            this.badge ?? '',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(
            this.icon,
            size: this.size,
            color: this.onPress == null ? Colors.grey : this.color,
          ),
        ),
      ),
      onTap: this.onPress,
    );
  }
}
