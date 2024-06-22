import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:slash/Home/presentation/bloc/home_bloc.dart';
import 'package:slash/core/common_view_state.dart';
import 'package:slash/Home/presentation/widgets/cats_lazy_row.dart';
import 'package:slash/Home/presentation/widgets/header_text.dart';
import 'package:slash/Home/presentation/widgets/home_header.dart';
import 'package:slash/Home/presentation/widgets/images_slider.dart';
import 'package:slash/Home/presentation/widgets/my_search_bar.dart';
import 'package:slash/Home/presentation/widgets/products_lazy_row.dart';
import 'package:slash/Home/presentation/view_state/home_view_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final _bloc = GetIt.instance<HomeBloc>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget._bloc.loadall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _inputController = TextEditingController();
    // ApiResponse apiResponse = Provider.of<MediaViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const HomeHeader(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: MySearchBar(),
              ),
              BlocConsumer<HomeBloc, HomeViewState>(
                bloc: widget._bloc,
                listener: (context, state) => {},
                builder: (context, state) {
                  if (state.dealsViewState is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ImagesSlider(
                          images: (state.dealsViewState as SuccessState).data,
                          height: (MediaQuery.of(context).orientation ==
                                  Orientation.portrait)
                              ? MediaQuery.of(context).size.height * 0.2
                              : MediaQuery.of(context).size.height * 0.5),
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              BlocConsumer<HomeBloc, HomeViewState>(
                bloc: widget._bloc,
                listener: (context, state) => {},
                builder: (context, state) {
                  if (state.catViewState is SuccessState) {
                    return Column(
                      children: [
                        const Headertext(category: "Categories"),
                        const SizedBox(
                          height: 10,
                        ),
                        CatsLazyRow(
                            cats: (state.catViewState as SuccessState).data),
                      ],
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              BlocConsumer<HomeBloc, HomeViewState>(
                bloc: widget._bloc,
                listener: (context, state) => {},
                builder: (context, state) {
                  if (state.bestSellingViewState is SuccessState) {
                    return ProductsLazyRow(
                        category: "Best Selling",
                        products:
                            (state.bestSellingViewState as SuccessState).data,
                        onFavouritePressed: (int id, bool isfavourite) {
                          widget._bloc.updateFavorite(id, isfavourite);
                        },
                        onCartPressed: (int id, bool iscart) {
                          widget._bloc.updateCart(id, iscart);
                        });
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              BlocConsumer<HomeBloc, HomeViewState>(
                bloc: widget._bloc,
                listener: (context, state) => {},
                builder: (context, state) {
                  if (state.newArrivalViewState is SuccessState) {
                    return ProductsLazyRow(
                      category: "NewArrival",
                      products:
                          (state.newArrivalViewState as SuccessState).data,
                      onFavouritePressed: (int id, bool isfavourite) {
                        widget._bloc.updateFavorite(id, isfavourite);
                      },
                      onCartPressed: (int id, bool iscart) {
                        widget._bloc.updateCart(id, iscart);
                      },
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              BlocConsumer<HomeBloc, HomeViewState>(
                bloc: widget._bloc,
                listener: (context, state) => {},
                builder: (context, state) {
                  if (state.recommendedViewState is SuccessState) {
                    return ProductsLazyRow(
                      category: "Recommended for you",
                      products:
                          (state.recommendedViewState as SuccessState).data,
                      onFavouritePressed: (int id, bool isfavourite) {
                        widget._bloc.updateFavorite(id, isfavourite);
                      },
                      onCartPressed: (int id, bool iscart) {
                        widget._bloc.updateCart(id, iscart);
                      },
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
            ]),
      ),
      // getMediaWidget(context, apiResponse),
    );
  }
}
