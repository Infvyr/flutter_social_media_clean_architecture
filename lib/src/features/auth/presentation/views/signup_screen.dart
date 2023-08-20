import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../constants/index.dart';
import '../blocs/signup/signup_cubit.dart';
import '../index.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? AppStrings.defaultErrorText),
                ),
              );
          }
        },
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Spacer(flex: 3),
                SignupUserName(),
                SizedBox(height: 10.0),
                SignupUserEmail(),
                SizedBox(height: 10.0),
                SignupUserPassword(),
                SizedBox(height: 10.0),
                SignupSubmitButton(),
                Spacer(flex: 2),
                SignupFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
