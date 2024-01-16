import 'package:flutter/material.dart';

import 'coffee_class.dart';

class CoffeeDetailsItemWidget extends StatelessWidget {
  final CoffeeClass? coffeeDetails;
  const CoffeeDetailsItemWidget({this.coffeeDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
          color: Colors.brown[60],
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.brown[coffeeDetails?.strength ?? 0],
            ),
            title: Text(coffeeDetails?.name ?? ''),
            subtitle: Text("Takes ${coffeeDetails?.sugars} sugar cube(s)"),
          )),
    );
  }
}
