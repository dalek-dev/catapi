// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:p_catapi/services/clients/api_client.dart' as _i3;
import 'package:p_catapi/src/domain/repository.dart' as _i4;
import 'package:p_catapi/src/presentation/landing/logic/cat_image_provider.dart'
    as _i6;
import 'package:p_catapi/src/presentation/landing/logic/landing_provider.dart'
    as _i7;
import 'package:p_catapi/src/presentation/landing/logic/search_provider.dart'
    as _i5;

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
    gh.factory<_i3.ApiClient>(() => _i3.ApiClientImpl());
    gh.factory<_i4.Repository>(
        () => _i4.RepositoryImpl(client: gh<_i3.ApiClient>()));
    gh.factory<_i5.SearchProvider>(() => _i5.SearchProvider());
    gh.factory<_i6.CatImageProvider>(
        () => _i6.CatImageProvider(repository: gh<_i4.Repository>()));
    gh.factory<_i7.LandingProvider>(
        () => _i7.LandingProvider(repository: gh<_i4.Repository>()));
    return this;
  }
}
