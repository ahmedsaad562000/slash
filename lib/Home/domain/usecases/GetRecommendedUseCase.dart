import 'package:injectable/injectable.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/repositry/home_repositry.dart';

@lazySingleton
class GetRecommendedUseCase {
  //// [GetRecommendedUseCase] is a class that represents a use case for fetching recommended products.
  final HomeRepositry homeRepositry;

  GetRecommendedUseCase(this.homeRepositry);

  Future<DataState<List<Product>>> call() async {
    return await homeRepositry.getRecommendedProducts();
  }
}
