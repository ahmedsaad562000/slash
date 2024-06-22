import 'package:injectable/injectable.dart';
import 'package:slash/model/domain/data_state.dart';
import 'package:slash/model/domain/models/category.dart';

@lazySingleton
class GetCategoriesUseCase {
  Future<DataState<List<Category>>> call() async {
    return DataState.success(categories);
  }
}
