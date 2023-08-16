import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/index.dart';
import '../../blocs/signup/signup_cubit.dart';

class SignupUserName extends StatelessWidget {
  const SignupUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) {
        return previous.username != current.username;
      },
      builder: (context, state) {
        return CustomTextField(
          key: const Key('signupForm_username'),
          labelText: 'Username',
          hintText: 'Enter your username',
          keyboardType: TextInputType.name,
          errorText: state.username.displayError != null ? '' : null,
          onChanged: (username) => context.read<SignupCubit>().onUsernameChanged(username),
        );
      },
    );
  }
}
