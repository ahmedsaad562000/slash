import 'package:flutter/material.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:slash/view/visual_data/category.dart';
import 'package:slash/view/widgets/cats_lazy_row.dart';
import 'package:slash/view/widgets/header_text.dart';
import 'package:slash/view/widgets/home_header.dart';
import 'package:slash/view/widgets/images_slider.dart';
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
    List<String> banner_images = [
      "assets/images/hot_deal_1.png",
      "https://static.wixstatic.com/media/04c490_ed970a7bd6a438f9a573f5a084147da2.gif"
    ];
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ImagesSlider(
                    images: banner_images,
                    height: MediaQuery.of(context).size.height * 0.2),
              ),
              Column(
                children: [
                  const Headertext(category: "Categories"),
                  const SizedBox(
                    height: 10,
                  ),
                  CatsLazyRow(cats: categories),
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
