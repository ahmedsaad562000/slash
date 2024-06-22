import 'package:injectable/injectable.dart';
import 'package:slash/model/data/local/local_data_source.dart';
import 'package:slash/model/domain/models/product.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

@injectable
class LocalDataSourceImpl implements LocalDataSource {
  final localDataPath = 'assets/data/dummyData.json';

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
    final jsonString = await rootBundle.loadString(localDataPath);
    final jsonResponse = json.decode(jsonString);
    final List<dynamic> categoryJson = jsonResponse[category];

    return categoryJson.map((item) => Product.fromJson(item)).toList();
  }
}
