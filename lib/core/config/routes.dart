import 'package:clean_arch_bookly_app/features/home/presentation/manager/launch_url_cubit/launch_url_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/manager/search_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repositories/details_repo_impl.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../features/home/domain/use_cases/launch_book_url_use_case.dart';
import '../../features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';
import '../utils/app_strings.dart';
import '../utils/functions/setup_service_locator.dart';

abstract class Routes {
  static const String initialPageRoute = '/';
  static const String homePageRoute = '/home Page';
  static const String detailsPageRoute = '/details Page';
  static const String searchPageRoute = '/search Page';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialPageRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashView();
        });

      case Routes.homePageRoute:
        return MaterialPageRoute(builder: ((context) {
          return MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => FeaturedBooksCubit(
                  FetchFeaturedBooksUseCase(
                      homeRepo: getIt.get<HomeRepoImpl>()),
                )..fetchFeaturedBooks()),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
              )..fetchNewestBooks(),
            )
          ], child: const HomeView());
        }));

      case Routes.detailsPageRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) =>
                LaunchUrlCubit(launchBookUrlUseCase: LaunchBookUrlUseCase(
                  detailsRepo: getIt.get<DetailRepoImpl>(),
                )),
            child: const BookDetailsView(),
          );
        });

      case Routes.searchPageRoute:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => SearchCubit(
                SearchUseCase(searchRepo: getIt.get<SearchRpoImpl>()))),
            child: const SearchView(),
          );
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}
