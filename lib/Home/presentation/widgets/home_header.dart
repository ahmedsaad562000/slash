import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            'Slash.',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MingCute.location_fill,
                color: Theme.of(context).cardColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: Theme.of(context).textTheme.displaySmall,
                    "Nasr City",
                  ),
                  Text(
                    "Cairo",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Bootstrap.chevron_down,
                    color: Theme.of(context).cardColor,
                  ))
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(
                Iconsax.notification_outline,
                color: Theme.of(context).cardColor,
              )),
        )
      ],
    );
  }
}
