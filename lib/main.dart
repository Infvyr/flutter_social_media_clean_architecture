import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'src/config/index.dart';
import 'src/features/auth/data/data_sources/index.dart';
import 'src/features/auth/data/repositories/index.dart';
import 'src/features/auth/domain/usecases/index.dart';
import 'src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'src/features/auth/presentation/blocs/login/login_cubit.dart';
import 'src/features/auth/presentation/blocs/signup/signup_cubit.dart';
import 'src/features/chat/data/data_sources/index.dart';
import 'src/features/chat/data/models/chat_model.dart';
import 'src/features/chat/data/models/message_model.dart';
import 'src/features/chat/data/repositories/chat_repository_impl.dart';
import 'src/features/content/domain/usecases/index.dart';
import 'src/features/content/presentation/blocs/add_content/add_content_cubit.dart';
import 'src/features/content/presentation/index.dart';
import 'src/features/feed/data/data_sources/index.dart';
import 'src/features/feed/data/repository/index.dart';
import 'src/features/feed/domain/usecases/index.dart';
import 'src/features/feed/presentation/blocs/discover/discover_bloc.dart';
import 'src/features/feed/presentation/blocs/feed/feed_bloc.dart';
import 'src/shared/data/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(PostModelAdapter());
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(MessageModelAdapter());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          create: (_) => PostRepositoryImpl(
            MockFeedDataSourceImpl(),
            LocalFeedDatasourceImpl(),
          ),
        ),
        RepositoryProvider(
          create: (_) => UserRepositoryImpl(MockFeedDataSourceImpl()),
        ),
        RepositoryProvider(
          create: (_) => ChatRepositoryImpl(
            LocalChatDataSourceImpl(),
            MockChatDataSourceImpl(),
          ),
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
            create: (context) => LoginCubit(
              loginUser: LoginUser(
                context.read<AuthRepositoryImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => SignupCubit(
              signupUser: SignupUser(
                context.read<AuthRepositoryImpl>(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => FeedBloc(
              getPosts: GetPosts(
                context.read<PostRepositoryImpl>(),
              ),
            )..add(GetFeedPostsEvent()),
          ),
          BlocProvider(
            create: (context) => DiscoverBloc(
              getDiscoverUsers: GetUsers(
                context.read<UserRepositoryImpl>(),
              ),
            )..add(const GetDiscoverUsersEvent()),
          ),
          BlocProvider(
            create: (context) => AddContentCubit(
              createPost: CreatePost(
                context.read<PostRepositoryImpl>(),
              ),
            ),
            child: const AddContentScreen(),
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
