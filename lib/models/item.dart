import 'package:flutter/material.dart';



class Item {
  String name;
  final Color color = Colors.primaries[1];
  double price = 42;

  Item(this.name, this.price);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) => other is Item && other.name == name;
}