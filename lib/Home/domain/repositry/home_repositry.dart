import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';

/// [HomeRepositry] is an interface for fetching product data from a Data soruces.
///
abstract class HomeRepositry {
  /// getRecommendedProducts is a method to fetch recommended products from a Data soruces.
  Future<DataState<List<Product>>> getRecommendedProducts();

  /// getBestSellingProducts is a method to fetch best selling products from a Data soruces.
  Future<DataState<List<Product>>> getBestSellingProducts();

  /// getNewArrivalProducts is a method to fetch new arrival products from a Data soruces.
  Future<DataState<List<Product>>> getNewArrivalProducts();
}
