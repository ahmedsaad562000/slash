import 'package:injectable/injectable.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/repositry/home_repositry.dart';

@lazySingleton
class GetNewArrivalUseCase {
  final HomeRepositry homeRepositry;

  GetNewArrivalUseCase(this.homeRepositry);

  Future<DataState<List<Product>>> call() async {
    return await homeRepositry.getNewArrivalProducts();
  }
}
