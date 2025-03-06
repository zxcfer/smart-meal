import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/router/app_router.dart';
import 'package:smart_meal/core/theme/app_theme.dart';
import 'package:smart_meal/core/theme/bloc/theme_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final isDarkMode = (state as ThemeInitial).isDarkMode;
          return MaterialApp.router(
            title: 'Smart Meal',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
