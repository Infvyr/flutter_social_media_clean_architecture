import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/index.dart';
import '../../../../shared/presentation/index.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Spacer(flex: 3),
              _UserName(),
              SizedBox(height: 10.0),
              _UserEmail(),
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
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      labelText: 'Username',
      keyboardType: TextInputType.name,
    );
  }
}

class _UserEmail extends StatelessWidget {
  const _UserEmail();

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      labelText: 'Email address',
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _UserPassword extends StatelessWidget {
  const _UserPassword();

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      labelText: 'Password',
      obscureText: true,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
      ),
      child: Text(
        'Sign Up',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
      ),
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
          const TextSpan(text: "Already have an account? "),
          TextSpan(
            text: 'Sign in',
            style: Theme.of(context).textTheme.labelLarge,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.goNamed(AppRoutes.login.name);
              },
          ),
        ],
      ),
    );
  }
}
