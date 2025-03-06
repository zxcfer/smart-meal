import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_meal/features/auth/presentation/pages/login_page.dart';
import 'package:smart_meal/features/auth/presentation/pages/onboarding_page.dart';
import 'package:smart_meal/features/auth/presentation/pages/profile_setup_complete_page.dart';
import 'package:smart_meal/features/auth/presentation/pages/profile_setup_page.dart';
import 'package:smart_meal/features/home/presentation/pages/home_page.dart';
import 'package:smart_meal/features/profile/presentation/pages/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: OnboardingRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: ProfileSetupCompleteRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: ProfileSetupRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 400,
        ),
      ];

  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400,
        reverseDurationInMilliseconds: 400,
      );
}
