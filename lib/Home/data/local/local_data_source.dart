import 'package:slash/Home/domain/models/product.dart';

abstract class LocalDataSource {
  /// [LocalDataSource] is an interface for fetching product data from a local JSON file.
  Future<List<Product>?> getBestSellingProducts();

  Future<List<Product>?> getNewArrivalProducts();

  Future<List<Product>?> getRecommendedProducts();
}
