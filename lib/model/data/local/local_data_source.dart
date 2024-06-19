import 'package:slash/model/domain/models/product.dart';

abstract class LocalDataSource {
  Future<List<Product>?> getBestSellingProducts();

  Future<List<Product>?> getNewArrivalProducts();

  Future<List<Product>?> getRecommendedProducts();
}
