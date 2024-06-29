import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:slash/Home/presentation/screens/navBar.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset(
        'assets/images/icons/slash.svg',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Theme.of(context).scaffoldBackgroundColor,
          BlendMode.srcIn,
        ),
      ),
      splashIconSize: 100,
      centered: true,
      backgroundColor: Colors.black,
      nextScreen: const NavBar(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
