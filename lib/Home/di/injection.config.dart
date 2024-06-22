// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:slash/Home/data/local/local_data_source.dart' as _i7;
import 'package:slash/Home/data/local/local_data_source_impl.dart' as _i3;
import 'package:slash/Home/data/repositry/home_repositry_impl.dart' as _i8;
import 'package:slash/Home/di/home_module.dart' as _i13;
import 'package:slash/Home/domain/repositry/home_repositry.dart' as _i9;
import 'package:slash/Home/domain/usecases/GetBestSellingUseCase.dart' as _i10;
import 'package:slash/Home/domain/usecases/GetCategoriesUseCase.dart' as _i4;
import 'package:slash/Home/domain/usecases/GetDealsUseCase.dart' as _i5;
import 'package:slash/Home/domain/usecases/GetNewArrivalUseCase.dart' as _i11;
import 'package:slash/Home/domain/usecases/GetRecommendedUseCase.dart' as _i12;
import 'package:slash/Home/presentation/bloc/home_bloc.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final homeModule = _$HomeModule();
    gh.factory<_i3.LocalDataSourceImpl>(() => _i3.LocalDataSourceImpl());
    gh.lazySingleton<_i4.GetCategoriesUseCase>(
        () => _i4.GetCategoriesUseCase());
    gh.lazySingleton<_i5.GetDealsUseCase>(() => _i5.GetDealsUseCase());
    gh.lazySingleton<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.singleton<_i7.LocalDataSource>(
        () => homeModule.provideLocalDataSource(gh<_i3.LocalDataSourceImpl>()));
    gh.factory<_i8.HomeRepositoryImpl>(
        () => _i8.HomeRepositoryImpl(gh<_i7.LocalDataSource>()));
    gh.singleton<_i9.HomeRepositry>(
        () => homeModule.provideHomeRepository(gh<_i8.HomeRepositoryImpl>()));
    gh.lazySingleton<_i10.GetBestSellingUseCase>(
        () => _i10.GetBestSellingUseCase(gh<_i9.HomeRepositry>()));
    gh.lazySingleton<_i11.GetNewArrivalUseCase>(
        () => _i11.GetNewArrivalUseCase(gh<_i9.HomeRepositry>()));
    gh.lazySingleton<_i12.GetRecommendedUseCase>(
        () => _i12.GetRecommendedUseCase(gh<_i9.HomeRepositry>()));
    return this;
  }
}

class _$HomeModule extends _i13.HomeModule {}
