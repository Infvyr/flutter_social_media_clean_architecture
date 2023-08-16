import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/index.dart';
import 'src/features/auth/data/data_sources/index.dart';
import 'src/features/auth/data/repositories/index.dart';
import 'src/features/auth/domain/usecases/index.dart';
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'src/features/auth/presentation/blocs/login/login_cubit.dart';
import 'src/features/auth/presentation/blocs/signup/signup_cubit.dart';

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
