import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Category {
  String name;
  IconData icon;

  Category({required this.name, required this.icon});
}

List<Category> categories = [
  Category(
    name: 'Fashion',
    icon: FontAwesome.shirt_solid,
  ),
  Category(
    name: 'Games',
    icon: FontAwesome.dice_five_solid,
  ),
  Category(
    name: 'Accessories',
    icon: FontAwesome.glasses_solid,
  ),
  Category(
    name: 'Books',
    icon: FontAwesome.book_solid,
  ),
  Category(
    name: 'Artifacts',
    icon: FontAwesome.palette_solid,
  ),
];
