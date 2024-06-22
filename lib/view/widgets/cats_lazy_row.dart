import 'package:flutter/material.dart';
import 'package:slash/view/visual_data/category.dart';
import 'package:slash/view/widgets/category_btn.dart';

class CatsLazyRow extends StatelessWidget {
  final List<Category> cats;
  const CatsLazyRow({required this.cats, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...cats.map(
            (cat) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? MediaQuery.of(context).size.width / 4.2
                      : MediaQuery.of(context).size.width / 6.3,
              child: Column(
                children: [
                  CategoryBtn(cat.name, cat.icon, () {}, 35),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    overflow: TextOverflow.visible,
                    cat.name,
                    style: Theme.of(context).textTheme.displaySmall,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}