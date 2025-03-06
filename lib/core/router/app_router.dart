import 'package:auto_route/auto_route.dart';
import 'package:smart_meal/features/home/presentation/pages/home_page.dart';
import 'package:smart_meal/features/profile/presentation/pages/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Add routes here
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
      ];
}
