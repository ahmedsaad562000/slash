import 'package:injectable/injectable.dart';
import 'package:slash/model/domain/data_state.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:slash/model/domain/repositry/home_repositry.dart';

@lazySingleton
class GetNewArrivalUseCase {
  final HomeRepositry homeRepositry;

  GetNewArrivalUseCase(this.homeRepositry);

  Future<DataState<List<Product>>> call() async {
    return await homeRepositry.getNewArrivalProducts();
  }
}
