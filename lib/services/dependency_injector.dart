import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_injector.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();
