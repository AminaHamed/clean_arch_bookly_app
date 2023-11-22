import 'package:clean_arch_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:clean_arch_bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/config/routers.dart';
import 'core/config/theme.dart';
import 'core/utils/constants.dart';
import 'core/utils/functions/setup_service_locator.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  FetchFeaturedBooksUseCase(
                      homeRepo: getIt.get<HomeRepoImpl>()),
                )..fetchFeaturedBooks()),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: myTheme(),
      ),
    );
  }
}
