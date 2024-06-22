import 'package:injectable/injectable.dart';
import 'package:slash/Home/data/local/local_data_source.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/repositry/home_repositry.dart';

@injectable
class HomeRepositoryImpl implements HomeRepositry {
  final LocalDataSource productsProvider;

  HomeRepositoryImpl(this.productsProvider);
  @override
  Future<DataState<List<Product>>> getRecommendedProducts() async {
    final recommendedProducts = await productsProvider.getRecommendedProducts();
    if (recommendedProducts == null) {
      return DataState.error(Exception('Failed to load recommended products'));
    } else if (recommendedProducts.isEmpty) {
      return DataState.empty();
    } else {
      return DataState.success(recommendedProducts);
    }
  }

  @override
  Future<DataState<List<Product>>> getBestSellingProducts() async {
    final bestSellingProducts = await productsProvider.getBestSellingProducts();
    if (bestSellingProducts == null) {
      return DataState.error(Exception('Failed to load best selling products'));
    } else if (bestSellingProducts.isEmpty) {
      return DataState.empty();
    } else {
      return DataState.success(bestSellingProducts);
    }
  }

  @override
  Future<DataState<List<Product>>> getNewArrivalProducts() async {
    final newArrivalProducts = await productsProvider.getNewArrivalProducts();
    if (newArrivalProducts == null) {
      return DataState.error(Exception('Failed to load new arrival products'));
    } else if (newArrivalProducts.isEmpty) {
      return DataState.empty();
    } else {
      return DataState.success(newArrivalProducts);
    }
  }
}
