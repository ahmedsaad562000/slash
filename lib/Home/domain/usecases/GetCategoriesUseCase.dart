import 'package:injectable/injectable.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/category.dart';

@lazySingleton
class GetCategoriesUseCase {
  /// [GetCategoriesUseCase] is a class that represents a use case for fetching categories.
  Future<DataState<List<Category>>> call() async {
    return DataState.success(categories);
  }
}
