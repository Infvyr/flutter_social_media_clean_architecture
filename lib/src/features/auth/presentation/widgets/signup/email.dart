import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/index.dart';
import '../../blocs/signup/signup_cubit.dart';

class SignupUserEmail extends StatelessWidget {
  const SignupUserEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) {
        return previous.email != current.email;
      },
      builder: (context, state) {
        return CustomTextField(
          key: const Key('signupForm_email'),
          labelText: 'Email address',
          hintText: 'Enter your email address',
          keyboardType: TextInputType.emailAddress,
          errorText: state.email.displayError != null ? '' : null,
          onChanged: (email) => context.read<SignupCubit>().onEmailChanged(email),
        );
      },
    );
  }
}
