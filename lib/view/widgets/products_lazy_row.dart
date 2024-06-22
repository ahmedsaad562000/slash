import 'package:flutter/material.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:slash/view/widgets/header_text.dart';
import 'package:slash/view/widgets/product_card.dart';

class ProductsLazyRow extends StatefulWidget {
  final String category;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final List<Product> products;

  const ProductsLazyRow(
      {required this.category,
      required this.products,
      required this.onFavouritePressed,
      required this.onCartPressed,
      super.key});

  @override
  State<ProductsLazyRow> createState() => _ProductsLazyRowState();
}

class _ProductsLazyRowState extends State<ProductsLazyRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Headertext(category: widget.category),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...widget.products.map((product) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: ProductCard(
                        id: product.id,
                        name: product.name,
                        imagePath: product.image,
                        price: product.price,
                        height: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? MediaQuery.of(context).size.height / 4
                            : MediaQuery.of(context).size.height / 2,
                        onTap: () {},
                        isfavourite: product.isfavourite,
                        iscart: product.iscart,
                        onFavouritePressed: widget.onFavouritePressed,
                        onCartPressed: widget.onCartPressed,
                      ))),
                ]),
          ),
        ),
      ],
    );
  }
}
