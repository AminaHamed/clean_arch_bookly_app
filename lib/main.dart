import 'package:clean_arch_bookly_app/config/theme.dart';
import 'package:flutter/material.dart';

import 'config/routers.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
    );
  }
}
