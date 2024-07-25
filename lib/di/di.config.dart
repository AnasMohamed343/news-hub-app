// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/datasource_contract/news_datasource.dart' as _i4;
import '../data/datasource_contract/news_source_datasource.dart' as _i6;
import '../data/datasource_impl/news_datasource_impl.dart' as _i5;
import '../data/datasource_impl/news_source_datasource_impl.dart' as _i7;
import '../data/repository_impl/news_repository_impl.dart' as _i11;
import '../data/repository_impl/news_source_repository_impl.dart' as _i9;
import '../repository_contract/news_repository.dart' as _i10;
import '../repository_contract/news_source_repository.dart' as _i8;
import '../ui/home/categories_fragment/category_details_view_model.dart'
    as _i12;
import '../ui/home/news_fragment/news_list_view_model.dart' as _i13;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.NewsDataSource>(
        () => _i5.NewsDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.NewsSourceDataSource>(
        () => _i7.NewsSourceDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.NewsSourceRepository>(() => _i9.NewsSourceRepositoryImpl(
        newsSourceDataSource: gh<_i6.NewsSourceDataSource>()));
    gh.factory<_i10.NewsRepository>(() =>
        _i11.NewsRepositoryImpl(newsDataSource: gh<_i4.NewsDataSource>()));
    gh.factory<_i12.CategoryDetailsViewModel>(() =>
        _i12.CategoryDetailsViewModel(
            newsSourceRepository: gh<_i8.NewsSourceRepository>()));
    gh.factory<_i13.NewsListViewModel>(() =>
        _i13.NewsListViewModel(newsRepository: gh<_i10.NewsRepository>()));
    return this;
  }
}
