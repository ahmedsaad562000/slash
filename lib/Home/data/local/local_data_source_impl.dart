import 'package:injectable/injectable.dart';
import 'package:slash/Home/data/local/local_data_source.dart';
import 'package:slash/Home/domain/models/product.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// Local Data Source Implementation for Home
@injectable
class LocalDataSourceImpl implements LocalDataSource {
  final localDataPath = 'assets/data/dummyData.json';

  /// [LocalDataSourceImpl] is an implementation of [LocalDataSource].
  /// It provides methods to fetch product data from a local JSON file.
  @override
  Future<List<Product>?> getBestSellingProducts() async {
    // read json data

    return await loadCategoryData('bestSelling');
  }

  @override
  Future<List<Product>?> getNewArrivalProducts() async {
    return await loadCategoryData('newArrival');
  }

  @override
  Future<List<Product>?> getRecommendedProducts() async {
    return await loadCategoryData('recommendedForYou');
  }

  Future<List<Product>> loadCategoryData(String category) async {
    /// read json data
    /// [localDataPath] is a path to the local JSON file
    /// [category] is the category of products to be loaded
    /// returns a list of [Product] objects
    final jsonString = await rootBundle.loadString(localDataPath);
    final jsonResponse = json.decode(jsonString);
    final List<dynamic> categoryJson = jsonResponse[category];

    return categoryJson.map((item) => Product.fromJson(item)).toList();
  }
}
