import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slash/Home/presentation/widgets/shimmer_product_card.dart';

class ShimmerProductsLazyRow extends StatelessWidget {
  const ShimmerProductsLazyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                    6,
                    (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: ShimmerProductCard(
                            height: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? MediaQuery.of(context).size.height / 4.5
                                : MediaQuery.of(context).size.height / 2)))
              ]),
        ),
      ),
    );
  }
}
