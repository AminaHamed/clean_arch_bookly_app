import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../utils/functions/setup_service_locator.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) =>
            MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) =>
                      FeaturedBooksCubit(
                        FetchFeaturedBooksUseCase(
                            homeRepo: getIt.get<HomeRepoImpl>()),
                      )
                        ..fetchFeaturedBooks()),
                  BlocProvider(
                    create: (context) =>
                    NewestBooksCubit(
                      FetchNewestBooksUseCase(
                          homeRepo: getIt.get<HomeRepoImpl>()),
                    )
                      ..fetchNewestBooks(),
                  )
                ], child: const HomeView()),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
