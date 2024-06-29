import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCatsLazyRow extends StatelessWidget {
  final double height;
  const ShimmerCatsLazyRow({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 7),
                ...List.generate(
                  6,
                  (index) => Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: height,
                    width: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? MediaQuery.of(context).size.width / 4.4
                        : MediaQuery.of(context).size.width / 6.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
