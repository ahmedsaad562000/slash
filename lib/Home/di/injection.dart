import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:slash/Home/di/injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void setup() => getIt.init();
