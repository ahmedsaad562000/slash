import 'package:injectable/injectable.dart';

import 'package:slash/Home/data/local/local_data_source.dart';
import 'package:slash/Home/data/local/local_data_source_impl.dart';
import 'package:slash/Home/data/repositry/home_repositry_impl.dart';
import 'package:slash/Home/domain/repositry/home_repositry.dart';

@module
abstract class HomeModule {
  /// [HomeModule] provides the Dependency Injection for both [HomeRepositry] and [LocalDataSource].
  @singleton
  HomeRepositry provideHomeRepository(HomeRepositoryImpl imp) => imp;

  @singleton
  LocalDataSource provideLocalDataSource(LocalDataSourceImpl imp) => imp;
}
