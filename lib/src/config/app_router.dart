import 'dart:async' show Stream, StreamSubscription;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constants/index.dart';
import '../features/auth/data/data_sources/index.dart';
import '../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../features/auth/presentation/index.dart';
import '../features/content/domain/usecases/index.dart';
import '../features/content/presentation/blocs/manage_content/manage_content_bloc.dart';
import '../features/content/presentation/index.dart';
import '../features/feed/data/repository/index.dart';
import '../features/feed/domain/usecases/index.dart';
import '../features/feed/presentation/index.dart';

class AppRouter {
  AppRouter(this.authBloc);

  final AuthBloc authBloc;

  GoRouter get router => _router;

  /// The route configuration.
  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoutes.feed.name,
        path: '/',
        builder: (_, __) => const FeedScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.discover.name,
            path: AppRoutes.discover.name,
            builder: (_, __) => const DiscoverScreen(),
            routes: <RouteBase>[
              GoRoute(
                name: 'user',
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
        path: '/${AppRoutes.login.name}',
        builder: (_, __) => const LoginScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.signup.name,
            path: AppRoutes.signup.name,
            builder: (_, __) => const SignupScreen(),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.addContent.name,
        path: '/${AppRoutes.addContent.name}',
        builder: (_, __) => const AddContentScreen(),
      ),
      GoRoute(
        name: AppRoutes.profile.name,
        path: '/${AppRoutes.profile.name}',
        builder: (_, __) => BlocProvider(
          create: (context) => ManageContentBloc(
            getPostsByUser: GetPostsByUser(
              context.read<PostRepositoryImpl>(),
            ),
            deletePost: DeletePost(
              context.read<PostRepositoryImpl>(),
            ),
          )..add(
              ManageContentGetPostsByUserEvent(
                userId: context.read<AuthBloc>().state.user.id,
              ),
            ),
          child: const ManageContentScreen(),
        ),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loginLocation = state.namedLocation(AppRoutes.login.name);
      final signupLocation = state.namedLocation(AppRoutes.signup.name);
      final isLoggedIn = authBloc.state.status == AuthStatus.authenticated;
      final isLoggingIn = state.matchedLocation == loginLocation;
      final isSigningUp = state.matchedLocation == signupLocation;

      if (!isLoggedIn && !isLoggingIn && !isSigningUp) {
        return loginLocation;
      }

      if (isLoggedIn && isLoggingIn) {
        return '/';
      }

      if (isLoggedIn && isSigningUp) {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
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
