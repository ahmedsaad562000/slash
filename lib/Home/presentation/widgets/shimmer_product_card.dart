import 'package:flutter/material.dart';

class ShimmerProductCard extends StatelessWidget {
  final double height;
  const ShimmerProductCard({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width / 6,
      height: height,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Flexible(
          flex: 5,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.grey.shade300,
              )),
        ),
        Flexible(
          flex: 1,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.grey.shade300,
              )),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.grey.shade300,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
