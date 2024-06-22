library CategoryButtonWidget;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slash/Home/presentation/widgets/image_widget.dart';

/// {@category Widgets}
///
/// This widget is a button that has a text and an arrow icon used in most styling.
///
class CategoryBtn extends StatefulWidget {
  final String icon;
  final double iconsize;
  final Function onPressed;
  const CategoryBtn(this.icon, this.onPressed, this.iconsize, {super.key});

  @override
  State<CategoryBtn> createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  @override
  Widget build(BuildContext context) {
    bool isSvg = widget.icon.endsWith('.svg');
    return InkWell(
      onTap: () => widget.onPressed(),
      borderRadius: BorderRadius.circular(widget.iconsize),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            radius: widget.iconsize,
            child: (isSvg)
                ? SvgPicture.asset(
                    widget.icon,
                    width: widget.iconsize,
                    height: widget.iconsize,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  )
                : SizedBox(
                    width: widget.iconsize,
                    height: widget.iconsize,
                    child: ImageWidget(
                      imagePath: widget.icon,
                    ),
                  ),
          ),
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => widget.onPressed(),
              borderRadius: BorderRadius.circular(widget.iconsize),
              splashColor: Colors.white
                  .withOpacity(0.3), // Customize splash color and opacity
              child: SizedBox(
                width: widget.iconsize * 2,
                height: widget.iconsize * 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
