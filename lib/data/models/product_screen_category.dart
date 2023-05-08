import 'package:flutter/material.dart';

class ProductScreenCategory {
  final String name;
  final IconData iconData;

  ProductScreenCategory({required this.name, required this.iconData});
}

final productScreenCategories = <ProductScreenCategory>[
  ProductScreenCategory(name: "Category", iconData: Icons.category),
  ProductScreenCategory(name: "Flight", iconData: Icons.flight),
  ProductScreenCategory(name: "Bill", iconData: Icons.brightness_low),
  ProductScreenCategory(name: "Data plan", iconData: Icons.ac_unit_rounded),
  ProductScreenCategory(name: "Top up", iconData: Icons.tonality_rounded),
];
