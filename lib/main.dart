import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/feed/data/data_sources/index.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/feed/data/repository/index.dart';

import 'src/config/index.dart';
import 'src/features/auth/data/data_sources/index.dart';
import 'src/features/auth/data/repositories/index.dart';
import 'src/features/auth/domain/usecases/index.dart';
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'src/features/auth/presentation/blocs/login/login_cubit.dart';
import 'src/features/auth/presentation/blocs/signup/signup_cubit.dart';
import 'src/features/feed/domain/usecases/index.dart';
import 'src/features/feed/presentation/blocs/feed/feed_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepositoryImpl(MockAuthDataSourcesImpl()),
        ),
        RepositoryProvider(
          create: (_) => PostRepositoryImpl(MockFeedDataSourceImpl()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              logoutUser: LogoutUser(context.read<AuthRepositoryImpl>()),
              getAuthStatus: GetAuthStatus(context.read<AuthRepositoryImpl>()),
              getLoggedInUser: GetLoggedInUser(context.read<AuthRepositoryImpl>()),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(loginUser: LoginUser(context.read<AuthRepositoryImpl>())),
          ),
          BlocProvider(
            create: (context) => SignupCubit(signupUser: SignupUser(context.read<AuthRepositoryImpl>())),
          ),
          BlocProvider(
            create: (context) => FeedBloc(getPosts: GetPosts(context.read<PostRepositoryImpl>()))..add(GetFeedPostsEvent()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.theme(),
              routerConfig: AppRouter(context.read<AuthBloc>()).router,
            );
          },
        ),
      ),
    );
  }
}
