import 'package:clean_arch_bookly_app/core/config/routes.dart';
import 'package:clean_arch_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/theme.dart';
import 'core/translation_helper/material_localizations.dart';
import 'core/utils/functions/init_hive.dart';
import 'core/utils/functions/setup_service_locator.dart';
import 'features/splash/cubit/locale_cubit.dart';

Future<void> main() async {
  await initHive();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: localizationsDelegates,
            localeResolutionCallback: localeResolutionCallback,
            debugShowCheckedModeBanner: false,
            theme: myTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
