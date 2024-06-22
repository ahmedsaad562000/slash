import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';

abstract class HomeRepositry {
  Future<DataState<List<Product>>> getRecommendedProducts();
  Future<DataState<List<Product>>> getBestSellingProducts();
  Future<DataState<List<Product>>> getNewArrivalProducts();
}
