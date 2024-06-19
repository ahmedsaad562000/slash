class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product(
      {this.id = 0,
      this.name = "default_name",
      this.description = "default_description",
      this.price = 0.0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
