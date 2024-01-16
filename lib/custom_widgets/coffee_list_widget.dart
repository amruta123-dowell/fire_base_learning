import 'package:firebase_learning/custom_widgets/coffee_class.dart';
import 'package:firebase_learning/custom_widgets/coffee_details_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeListWidget extends StatefulWidget {
  const CoffeeListWidget({super.key});

  @override
  State<CoffeeListWidget> createState() => _CoffeeListWidgetState();
}

class _CoffeeListWidgetState extends State<CoffeeListWidget> {
  @override
  Widget build(BuildContext context) {
    final coffeeList = Provider.of<List<CoffeeClass?>?>(context);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: coffeeList?.length ?? 0,
        itemBuilder: (context, index) {
          return CoffeeDetailsItemWidget(
            coffeeDetails: coffeeList?[index],
          );
        });
  }
}
