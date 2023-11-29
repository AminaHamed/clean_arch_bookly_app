import 'package:clean_arch_bookly_app/core/network/network_info.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/details_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/repositories/details_repo_impl.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/data/repositories/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../features/home/data/data_sources/home_local_data_source.dart';
import '../../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../../features/home/data/repositories/home_repo_impl.dart';
import '../../api/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<NetworkInfoImpl>(
    NetworkInfoImpl(connectionChecker: InternetConnectionChecker()),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeRemoteDataSource:
            HomeRemoteDataSourceDioImpl(apiService: getIt.get<ApiService>()),
        homeLocalDataSource: HomeLocalDataSourceImpl()),
  );

  getIt.registerSingleton<SearchRpoImpl>(
    SearchRpoImpl(
        networkInfo: getIt.get<NetworkInfoImpl>(),
        searchRemoteDataSource:
            SearchRemoteDataSourceImpl(apiService: getIt.get<ApiService>())),
  );

  getIt.registerSingleton<DetailRepoImpl>(
      DetailRepoImpl(detailsRemoteDataSource: DetailsRemoteDataSourceImpl()));
}
