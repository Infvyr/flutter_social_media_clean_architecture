import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../blocs/login/login_cubit.dart';
import '../index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          debugPrint('LoginScreen valid? : ${state.isValid}');
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Something went wrong. Please try again later.')),
              );
          }
        },
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Spacer(flex: 3),
                UserName(),
                SizedBox(height: 20.0),
                UserPassword(),
                SizedBox(height: 20.0),
                SubmitButton(),
                Spacer(flex: 2),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
