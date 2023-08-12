import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_social_media_with_clean_architecture/src/constants/index.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/index.dart';
import '../features/feed/presentation/index.dart';

class AppRouter {
  /// TODO: Add the auth bloc as an input
  AppRouter();

  GoRouter get router => _router;

  /// The route configuration.
  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoutes.feed.name,
        path: '/${AppRoutes.feed.name}',
        builder: (BuildContext context, GoRouterState state) {
          return const FeedScreen();
        },
        routes: [
          GoRoute(
            name: AppRoutes.discover.name,
            path: AppRoutes.discover.name,
            builder: (BuildContext context, GoRouterState state) {
              return const DiscoverScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.user.name,
                path: ':userId',
                builder: (BuildContext context, GoRouterState state) {
                  /// TODO: Change to the user screen
                  return const Text('User Screen');
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.login.name,
        // path: '/${AppRoutes.login.name}',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: [
          GoRoute(
            name: AppRoutes.signup.name,
            path: AppRoutes.signup.name,
            builder: (BuildContext context, GoRouterState state) {
              return const SignupScreen();
            },
          ),
        ],
      ),
    ],

    /// TODO: Redirect user to the login screen if they are not authenticated
    /// else redirect them to the feed screen
    // redirect:
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
