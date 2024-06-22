import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/Home/presentation/bloc/home_events.dart';
import 'package:slash/core/Event.dart';
import 'package:slash/core/common_view_state.dart';
import 'package:slash/core/data_state.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:slash/Home/domain/usecases/GetBestSellingUseCase.dart';
import 'package:slash/Home/domain/usecases/GetCategoriesUseCase.dart';
import 'package:slash/Home/domain/usecases/GetDealsUseCase.dart';
import 'package:slash/Home/domain/usecases/GetNewArrivalUseCase.dart';
import 'package:slash/Home/domain/usecases/GetRecommendedUseCase.dart';
import 'package:slash/Home/presentation/view_state/home_view_state.dart';

@lazySingleton
class HomeBloc extends Bloc<Event, HomeViewState> {
  final GetBestSellingUseCase bestSellingUseCase =
      GetIt.instance<GetBestSellingUseCase>();

  final GetNewArrivalUseCase newArrivalUseCase =
      GetIt.instance<GetNewArrivalUseCase>();

  final GetRecommendedUseCase recommendedUseCase =
      GetIt.instance<GetRecommendedUseCase>();

  final GetCategoriesUseCase catsUseCase =
      GetIt.instance<GetCategoriesUseCase>();

  final GetDealsUseCase dealsUseCase = GetIt.instance<GetDealsUseCase>();

  List<int> favorites = [];
  List<int> cart = [];

  HomeBloc() : super(const HomeViewState()) {
    on<GetBestSellingEvent>(_onGetBestSellingEvent);
    on<GetNewArrivalEvent>(_onGetNewArrivalEvent);
    on<GetRecommendedEvent>(_onGetRecommendedEvent);
    on<GetCatsEvent>(_onGetCatsEvent);
    on<GetDealsEvent>(_onGetDealsEvent);
  }

  _onGetBestSellingEvent(
      GetBestSellingEvent event, Emitter<HomeViewState> emitter) async {
    if (event.withLoading) {
      emitter(state.copyWith(bestSellingViewState: const LoadingState()));
    }

    final result = await bestSellingUseCase.call();

    if (result is Error) {
      emitter(state.copyWith(bestSellingViewState: const ErrorState("error")));
    } else if (result is Empty) {
      emitter(state.copyWith(bestSellingViewState: const EmptyState()));
    } else if (result is Success) {
      if (result.data == null || result.data == List.empty()) {
        emitter(state.copyWith(bestSellingViewState: const EmptyState()));
        return;
      }

      List<Product> products = (result as Success).data;

      for (Product element in products) {
        if (favorites.contains(element.id)) {
          element.isfavourite = true;
        }

        if (cart.contains(element.id)) {
          element.iscart = true;
        }
      }

      emitter(state.copyWith(bestSellingViewState: SuccessState(products)));
    }
  }

  // actions_call

  getBestSelling() {
    add(
      GetBestSellingEvent(),
    );
  }

  _onGetNewArrivalEvent(
      GetNewArrivalEvent event, Emitter<HomeViewState> emitter) async {
    if (event.withLoading) {
      emitter(state.copyWith(newArrivalViewState: const LoadingState()));
    }

    final result = await newArrivalUseCase.call();

    if (result is Error) {
      emitter(state.copyWith(newArrivalViewState: const ErrorState("error")));
    } else if (result is Empty) {
      emitter(state.copyWith(newArrivalViewState: const EmptyState()));
    } else if (result is Success) {
      if (result.data == null || result.data == List.empty()) {
        emitter(state.copyWith(newArrivalViewState: const EmptyState()));
        return;
      }

      List<Product> products = (result as Success).data;

      for (Product element in products) {
        if (favorites.contains(element.id)) {
          element.isfavourite = true;
        }

        if (cart.contains(element.id)) {
          element.iscart = true;
        }
      }

      emitter(state.copyWith(newArrivalViewState: SuccessState(products)));
    }
  }

  getNewArrival() {
    add(
      GetNewArrivalEvent(),
    );
  }

  _onGetRecommendedEvent(
      GetRecommendedEvent event, Emitter<HomeViewState> emitter) async {
    if (event.withLoading) {
      emitter(state.copyWith(recommendedViewState: const LoadingState()));
    }

    final result = await recommendedUseCase.call();

    if (result is Error) {
      emitter(state.copyWith(recommendedViewState: const ErrorState("error")));
    } else if (result is Empty) {
      emitter(state.copyWith(recommendedViewState: const EmptyState()));
    } else if (result is Success) {
      if (result.data == null || result.data == List.empty()) {
        emitter(state.copyWith(recommendedViewState: const EmptyState()));
        return;
      }

      List<Product> products = (result as Success).data;

      for (Product element in products) {
        if (favorites.contains(element.id)) {
          element.isfavourite = true;
        }

        if (cart.contains(element.id)) {
          element.iscart = true;
        }
      }

      emitter(state.copyWith(recommendedViewState: SuccessState(products)));
    }
  }

  getRecommended() {
    add(
      GetRecommendedEvent(),
    );
  }

  _onGetCatsEvent(GetCatsEvent event, Emitter<HomeViewState> emitter) async {
    if (event.withLoading) {
      emitter(state.copyWith(catViewState: const LoadingState()));
    }

    final result = await catsUseCase.call();

    if (result is Error) {
      emitter(state.copyWith(catViewState: const ErrorState("error")));
    } else if (result is Empty) {
      emitter(state.copyWith(catViewState: const EmptyState()));
    } else if (result is Success) {
      if (result.data == null || result.data == List.empty()) {
        emitter(state.copyWith(catViewState: const EmptyState()));
        return;
      }

      emitter(
          state.copyWith(catViewState: SuccessState((result as Success).data)));
    }
  }

  getCats() {
    add(
      GetCatsEvent(),
    );
  }

  _onGetDealsEvent(GetDealsEvent event, Emitter<HomeViewState> emitter) async {
    if (event.withLoading) {
      emitter(state.copyWith(dealsViewState: const LoadingState()));
    }

    final result = await dealsUseCase.call();

    if (result is Error) {
      emitter(state.copyWith(dealsViewState: const ErrorState("error")));
    } else if (result is Empty) {
      emitter(state.copyWith(dealsViewState: const EmptyState()));
    } else if (result is Success) {
      if (result.data == null || result.data == List.empty()) {
        emitter(state.copyWith(dealsViewState: const EmptyState()));
        return;
      }

      emitter(state.copyWith(
          dealsViewState: SuccessState((result as Success).data)));
    }
  }

  getDeals() {
    add(
      GetDealsEvent(),
    );
  }

  loadall() {
    getBestSelling();
    getNewArrival();
    getRecommended();
    getCats();
    getDeals();
  }

  addToFavorite(int product) {
    if (!favorites.contains(product)) {
      favorites.add(product);

      getBestSelling();
      getNewArrival();
      getRecommended();
    }
  }

  removeFromFavorite(int product) {
    if (favorites.contains(product)) {
      favorites.remove(product);

      getBestSelling();
      getNewArrival();
      getRecommended();
    }
  }

  updateFavorite(int id, bool isFavorite) {
    if (isFavorite) {
      addToFavorite(id);
    } else {
      removeFromFavorite(id);
    }
  }

  addToCart(int product) {
    if (!cart.contains(product)) {
      cart.add(product);

      getBestSelling();
      getNewArrival();
      getRecommended();
    }
  }

  removeFromCart(int product) {
    if (cart.contains(product)) {
      cart.remove(product);

      getBestSelling();
      getNewArrival();
      getRecommended();
    }
  }

  updateCart(int id, bool isCart) {
    if (isCart) {
      addToCart(id);
    } else {
      removeFromCart(id);
    }
  }
}
