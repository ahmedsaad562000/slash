class Product {
  /// [Product] is a class that represents a product.
  /// It has an id, a name, an image link or asset path, a price, and a boolean value for favourite and cart.
  final int id;
  final String name;
  final String image;
  final double price;

  bool isfavourite = false;
  bool iscart = false;

  Product(
      {this.id = 0,
      this.name = "default_name",
      this.image = "default_description",
      this.price = 0.0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}
