import 'package:bittersalt/pages/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, _) => const HomePage(),
      ),
    ],
  );

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // The Mandy red, light theme.
      theme: FlexThemeData.light(
        scheme: FlexScheme.greenM3,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        useMaterial3: true,
        scheme: FlexScheme.greenM3,
      ),
    );
  }
}
