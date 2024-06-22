import 'package:slash/core/common_view_state.dart';
import 'package:slash/core/view_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/models/category.dart';

/// [HomeViewState] is a class that represents the view state for home screen.
/// It contains the common view state for best selling, new arrival, recommended, category and deals.
/// these common view state are used in the home screen to show different views based on the state of the data.
class HomeViewState implements ViewState {
  final CommonViewState<List<Product>> bestSellingViewState;
  final CommonViewState<List<Product>> newArrivalViewState;
  final CommonViewState<List<Product>> recommendedViewState;
  final CommonViewState<List<Category>> catViewState;
  final CommonViewState<List<String>> dealsViewState;

  const HomeViewState({
    this.bestSellingViewState = const EmptyState(),
    this.newArrivalViewState = const EmptyState(),
    this.recommendedViewState = const EmptyState(),
    this.catViewState = const EmptyState(),
    this.dealsViewState = const EmptyState(),
  });

  HomeViewState copyWith({
    CommonViewState<List<Product>>? bestSellingViewState,
    CommonViewState<List<Product>>? newArrivalViewState,
    CommonViewState<List<Product>>? recommendedViewState,
    CommonViewState<List<Category>>? catViewState,
    CommonViewState<List<String>>? dealsViewState,
  }) {
    return HomeViewState(
      bestSellingViewState: bestSellingViewState ?? this.bestSellingViewState,
      newArrivalViewState: newArrivalViewState ?? this.newArrivalViewState,
      recommendedViewState: recommendedViewState ?? this.recommendedViewState,
      catViewState: catViewState ?? this.catViewState,
      dealsViewState: dealsViewState ?? this.dealsViewState,
    );
  }
}
