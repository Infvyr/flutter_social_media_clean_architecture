import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/blocs/login/login_cubit.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/index.dart';
import '../../../../shared/presentation/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Spacer(flex: 3),
                _UserName(),
                SizedBox(height: 10.0),
                _UserPassword(),
                SizedBox(height: 10.0),
                _SubmitButton(),
                Spacer(flex: 2),
                _Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.username != current.username;
      },
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Username',
          keyboardType: TextInputType.name,
          errorText: state.username.invalid ? 'The username is invalid' : null,
          onChanged: (value) => context.read<LoginCubit>().changeUsername(value),
        );
      },
    );
  }
}

class _UserPassword extends StatelessWidget {
  const _UserPassword();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.password != current.password;
      },
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Password',
          obscureText: true,
          errorText: state.password.invalid ? 'The password is invalid' : null,
          onChanged: (value) => context.read<LoginCubit>().changePassword(value),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return state.status == FormzStatus.submissionInProgress
            ? const CircularProgressIndicator()
            : FilledButton(
                onPressed: () {
                  state.status == FormzStatus.valid
                      ? context.read<LoginCubit>().loginWithCredentials()
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage!),
                            backgroundColor: Colors.red,
                          ),
                        );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
                ),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              );
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: 'Sign up',
            style: Theme.of(context).textTheme.labelLarge,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.goNamed(AppRoutes.signup.name);
              },
          ),
        ],
      ),
    );
  }
}
