import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:slash/view/widgets/category_btn.dart';
import 'package:slash/view/widgets/image_widget.dart';

class ProductCard extends StatefulWidget {
  final int id;
  final String name;
  final double price;
  final String imagePath;
  final double height;

  final Function onTap;

  const ProductCard(
      {required this.id,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.height,
      required this.onTap,
      super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width / 6,
      height: widget.height,
      child: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Flexible(
              flex: 5,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ImageWidget(
                    imagePath: widget.imagePath,
                  )),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.name,
                    style: Theme.of(context).textTheme.displayMedium,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "EGP ${(widget.price == widget.price.toInt()) ? widget.price.toInt() : widget.price}",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: AssetImage(
                          "assets/images/brand_${widget.id % 3 + 1}.png",
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      //
                      CategoryBtn(
                        "assets/images/icons/plus.svg",
                        () {},
                        11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                print("love it");
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).dialogBackgroundColor,
                child: Icon(
                  size: 20,
                  AntDesign.heart_outline,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
