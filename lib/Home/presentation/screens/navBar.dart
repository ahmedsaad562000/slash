import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart'; // Assuming this is your custom icon package
import 'package:slash/Home/presentation/screens/home_screen.dart'; // Import your actual screen widgets

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomeScreen(key: const PageStorageKey('Home')),
    const EmptyPage(text: "Favorites", key: PageStorageKey("Favorites")),
    const EmptyPage(text: "My Cart", key: PageStorageKey("Cart")),
    const EmptyPage(text: "Profile", key: PageStorageKey("Profile")),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    // _tabController.addListener(
    //   () {
    //     if (_tabController.indexIsChanging) {
    //       _pageController.animateToPage(
    //         _tabController.index,
    //         duration: const Duration(milliseconds: 300),
    //         curve: Curves.easeInOut,
    //       );
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      bottomNavigationBar: TabBar(
        onTap: (index) {
          _onPageChanged(index);
          _pageController.jumpToPage(index);
        },
        controller: _tabController,
        indicator: CustomTabIndicator(
          width: MediaQuery.of(context).size.width / 4.4,
          color: Theme.of(context).cardColor,
          context: context,
        ),
        labelStyle: Theme.of(context).textTheme.displaySmall,
        tabs: [
          Tab(
            icon: (_tabController.index == 0)
                ? const Icon(Iconsax.home_2_bold)
                : const Icon(Iconsax.home_2_outline),
            text: "Home",
          ),
          Tab(
            icon: (_tabController.index == 1)
                ? const Icon(Iconsax.heart_bold)
                : const Icon(Iconsax.heart_outline),
            text: "Favorites",
          ),
          Tab(
            icon: (_tabController.index == 2)
                ? const Icon(Iconsax.shopping_cart_bold)
                : const Icon(Iconsax.shopping_cart_outline),
            text: "My Cart",
          ),
          Tab(
            icon: (_tabController.index == 3)
                ? const Icon(Iconsax.profile_circle_bold)
                : const Icon(Iconsax.profile_circle_outline),
            text: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  final String text;

  const EmptyPage({
    this.text = "Empty Page",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final double width;
  final double height;
  final Color color;
  final BuildContext context;

  const CustomTabIndicator({
    this.width = 5,
    this.height = 5,
    this.color = Colors.blue,
    required this.context,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(
      width: width,
      height: height,
      color: color,
      context: context,
    );
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final double width;
  final double height;
  final Color color;
  final BuildContext context;

  _CustomTabIndicatorPainter({
    this.width = 5,
    this.height = 5,
    this.color = Colors.blue,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = color; // Customize the color here
    paint.style = PaintingStyle.fill;

    final double tabWidth = configuration.size!.width;
    final indicatorWidth = MediaQuery.of(context).size.width / 4.4;
    final double left = offset.dx + (tabWidth - indicatorWidth) / 2;
    final double top = offset.dy -
        5.0; // Adjust this value to position the indicator above the icon
    const double radius = 5.0; // Customize the radius here

    final Path path = Path()
      ..moveTo(left, top)
      ..lineTo(left + indicatorWidth, top)
      ..arcToPoint(
        Offset(left + indicatorWidth - 5, top + height),
        radius: const Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(left + indicatorWidth, top + height)
      ..lineTo(left + 5, top + height)
      ..arcToPoint(
        Offset(left, top),
        radius: const Radius.circular(radius),
        clockwise: true,
      )
      ..close();

    canvas.drawPath(path, paint);
  }
}
