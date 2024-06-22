import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:slash/view/visual_data/category.dart';
import 'package:slash/view/widgets/cats_lazy_row.dart';
import 'package:slash/view/widgets/header_text.dart';
import 'package:slash/view/widgets/home_header.dart';
import 'package:slash/view/widgets/my_search_bar.dart';
import 'package:slash/view/widgets/products_lazy_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Widget getMediaWidget(BuildContext context, ApiResponse apiResponse) {
  //   //TODO: List<Media>? mediaList = apiResponse.data as List<Media>?;
  //   switch (apiResponse.status) {
  //     case Status.loading:
  //       return Center(child: CircularProgressIndicator());
  //     case Status.completed:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Expanded(
  //               flex: 8,
  //               child: Container(

  //                   // TODO: implement search functionality
  //                   )),
  //           Expanded(
  //             flex: 2,
  //             child: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: Container(

  //                   // TODO: implement search functionality
  //                   ),
  //             ),
  //           ),
  //         ],
  //       );
  //     case Status.error:
  //       return const Center(
  //         child: Text('Please try again latter!!!'),
  //       );
  //     case Status.initial:
  //     default:
  //       return const Center(
  //         child: Text('Search the song by Artist'),
  //       );
  //   }
  // }

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
              Column(
                children: [
                  const MySearchBar(),
                  const Headertext(category: "Categories"),
                  const SizedBox(
                    height: 10,
                  ),
                  CatsLazyRow(cats: categories)
                ],
              ),
              ProductsLazyRow(
                  category: "Best Selling",
                  products: List<Product>.generate(
                    6,
                    (index) => Product(
                      id: index,
                      name: "Product $index",
                      image:
                          "assets/images/best_seller_${index + 1}.png", //"assets/images/recommended $index",
                      price: 50 * (index + 1),
                    ),
                  )),
              ProductsLazyRow(
                  category: "New Arrival",
                  products: List<Product>.generate(
                    6,
                    (index) => Product(
                      id: index,
                      name: "Product $index",
                      image:
                          "assets/images/new_arrival_${index + 1}.png", //"assets/images/recommended $index",
                      price: 50 * (index + 1),
                    ),
                  )),
              ProductsLazyRow(
                  category: "Recommended for you",
                  products: List<Product>.generate(
                    6,
                    (index) => Product(
                      id: index,
                      name: "Product $index",
                      image:
                          "assets/images/recommended_${index + 1}.png", //"assets/images/recommended $index",
                      price: 50 * (index + 1),
                    ),
                  )),
            ]),
      ),
      // getMediaWidget(context, apiResponse),
    );
  }
}
