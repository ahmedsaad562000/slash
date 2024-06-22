library CategoryButtonWidget;

import 'package:flutter/material.dart';

/// {@category Widgets}
///
/// This widget is a button that has a text and an arrow icon used in most styling.
///
class CategoryBtn extends StatelessWidget {
  final IconData icon;
  final double iconsize;
  final Function onPressed;
  final String category;
  const CategoryBtn(this.category, this.icon, this.onPressed, this.iconsize,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Theme.of(context).cardColor,
        radius: iconsize,
        child: IconButton(
          alignment: Alignment.center,
          icon: Icon(
            icon,
            size: iconsize * 0.8,
          ),
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () => onPressed(),
        ));
  }
}
