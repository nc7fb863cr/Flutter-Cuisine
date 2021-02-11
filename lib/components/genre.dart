import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isSelected;

  Genre({this.title, this.onPress, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Material(
          color: isSelected ?? false ? Colors.purpleAccent : Colors.transparent,
          child: InkWell(
            onTap: this.onPress ?? () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                this.title,
                style: TextStyle(
                  color: isSelected ?? false ? Colors.white : Colors.black,
                ),
              ),
              //decoration: BoxDecoration(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
