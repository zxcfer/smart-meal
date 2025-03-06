import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/core/theme/app_colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Meal'),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     context.watch<ThemeBloc>().state is ThemeInitial &&
          //             (context.watch<ThemeBloc>().state as ThemeInitial)
          //                 .isDarkMode
          //         ? Icons.light_mode
          //         : Icons.dark_mode,
          //   ),
          //   onPressed: () {
          //     context.read<ThemeBloc>().add(ToggleThemeEvent());
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.person),
          //   onPressed: () {
          //     context.router.push(const ProfileRoute());
          //   },
          // ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Smart Meal',
            style: TextStyle(color: AppColors.primary, fontSize: 25)),
      ),
    );
  }
}
