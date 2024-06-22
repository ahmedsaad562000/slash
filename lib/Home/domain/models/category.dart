class Category {
  /// [Category] is a class that represents a category of products.
  /// It has a name and an icon.
  String name;
  String icon;

  Category({required this.name, required this.icon});
}

List<Category> categories = [
  Category(
    name: 'Fashion',
    // icon: FontAwesome.shirt_solid,
    icon: "assets/images/icons/fashion.svg",
  ),
  Category(
    name: 'Games',
    // icon: FontAwesome.dice_five_solid,
    icon: "assets/images/icons/games.svg",
  ),
  Category(
    name: 'Accessories',
    // icon: FontAwesome.glasses_solid,
    icon: "assets/images/icons/glasses.svg",
  ),
  Category(
    name: 'Books',
    // icon: FontAwesome.book_solid,
    icon: "assets/images/icons/book.svg",
  ),
  Category(
    name: 'Artifacts',
    // icon: FontAwesome.palette_solid,
    icon: "assets/images/icons/palette.svg",
  ),
];
