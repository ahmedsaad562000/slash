import 'package:injectable/injectable.dart';

import 'package:slash/model/data/local/local_data_source.dart';
import 'package:slash/model/data/local/local_data_source_impl.dart';
import 'package:slash/model/data/repositry/home_repositry_impl.dart';
import 'package:slash/model/domain/repositry/home_repositry.dart';

@module
abstract class HomeModule {
  @singleton
  HomeRepositry provideHomeRepository(HomeRepositoryImpl imp) => imp;

  @singleton
  LocalDataSource provideLocalDataSource(LocalDataSourceImpl imp) => imp;

  // @singleton
  // GetBestSellingUseCase provideGetBestSellingUseCase(HomeRepositry imp) =>
  //     GetBestSellingUseCase(imp);

  // // @singleton
  // // HomeBloc provideHomeBloc(GetBestSellingUseCase getBestSellingUseCase) =>
  // //     HomeBloc(bestSellingUseCase: getBestSellingUseCase);
}
