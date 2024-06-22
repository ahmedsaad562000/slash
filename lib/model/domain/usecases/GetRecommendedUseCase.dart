import 'package:injectable/injectable.dart';
import 'package:slash/model/domain/data_state.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:slash/model/domain/repositry/home_repositry.dart';

@lazySingleton
class GetRecommendedUseCase {
  final HomeRepositry homeRepositry;

  GetRecommendedUseCase(this.homeRepositry);

  Future<DataState<List<Product>>> call() async {
    return await homeRepositry.getRecommendedProducts();
  }
}
