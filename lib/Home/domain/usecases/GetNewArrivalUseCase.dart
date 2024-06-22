import 'package:injectable/injectable.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/repositry/home_repositry.dart';

@lazySingleton
class GetNewArrivalUseCase {
  /// [GetNewArrivalUseCase] is a class that represents a use case for fetching new arrival products.
  final HomeRepositry homeRepositry;

  GetNewArrivalUseCase(this.homeRepositry);

  Future<DataState<List<Product>>> call() async {
    return await homeRepositry.getNewArrivalProducts();
  }
}
