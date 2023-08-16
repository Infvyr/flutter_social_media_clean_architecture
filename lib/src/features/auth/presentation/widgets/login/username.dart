import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/index.dart';
import '../../blocs/login/login_cubit.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.username != current.username;
      },
      builder: (context, state) {
        return CustomTextField(
          key: const Key('loginForm_username'),
          labelText: 'Username',
          hintText: 'Enter your username',
          keyboardType: TextInputType.name,
          errorText: state.username.displayError != null ? '' : null,
          onChanged: (username) => context.read<LoginCubit>().onUsernameChanged(username),
        );
      },
    );
  }
}
