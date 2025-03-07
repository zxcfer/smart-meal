// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityLevelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityLevelPage(),
      );
    },
    AllergiesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllergiesPage(),
      );
    },
    DietRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DietPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MealPreferencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MealPreferencesPage(),
      );
    },
    NutritionalGoalsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NutritionalGoalsPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    ProfileSetupCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileSetupCompleteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileSetupCompletePage(
          key: args.key,
          userName: args.userName,
        ),
      );
    },
    ProfileSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileSetupPage(),
      );
    },
  };
}

/// generated route for
/// [ActivityLevelPage]
class ActivityLevelRoute extends PageRouteInfo<void> {
  const ActivityLevelRoute({List<PageRouteInfo>? children})
      : super(
          ActivityLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityLevelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllergiesPage]
class AllergiesRoute extends PageRouteInfo<void> {
  const AllergiesRoute({List<PageRouteInfo>? children})
      : super(
          AllergiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllergiesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DietPage]
class DietRoute extends PageRouteInfo<void> {
  const DietRoute({List<PageRouteInfo>? children})
      : super(
          DietRoute.name,
          initialChildren: children,
        );

  static const String name = 'DietRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MealPreferencesPage]
class MealPreferencesRoute extends PageRouteInfo<void> {
  const MealPreferencesRoute({List<PageRouteInfo>? children})
      : super(
          MealPreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MealPreferencesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NutritionalGoalsPage]
class NutritionalGoalsRoute extends PageRouteInfo<void> {
  const NutritionalGoalsRoute({List<PageRouteInfo>? children})
      : super(
          NutritionalGoalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NutritionalGoalsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileSetupCompletePage]
class ProfileSetupCompleteRoute
    extends PageRouteInfo<ProfileSetupCompleteRouteArgs> {
  ProfileSetupCompleteRoute({
    Key? key,
    required String userName,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileSetupCompleteRoute.name,
          args: ProfileSetupCompleteRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileSetupCompleteRoute';

  static const PageInfo<ProfileSetupCompleteRouteArgs> page =
      PageInfo<ProfileSetupCompleteRouteArgs>(name);
}

class ProfileSetupCompleteRouteArgs {
  const ProfileSetupCompleteRouteArgs({
    this.key,
    required this.userName,
  });

  final Key? key;

  final String userName;

  @override
  String toString() {
    return 'ProfileSetupCompleteRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [ProfileSetupPage]
class ProfileSetupRoute extends PageRouteInfo<void> {
  const ProfileSetupRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
