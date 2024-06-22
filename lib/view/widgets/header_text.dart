import 'package:flutter/material.dart';

class Headertext extends StatelessWidget {
  final String category;
  const Headertext({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(category, style: Theme.of(context).textTheme.labelMedium),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("See all", style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  elevation: 0,
                  fillColor: const Color.fromARGB(255, 230, 230, 230),
                  onPressed: () {},
                  child: Icon(
                    size: 20,
                    Icons.chevron_right_rounded,
                    color: Theme.of(context).cardColor,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
