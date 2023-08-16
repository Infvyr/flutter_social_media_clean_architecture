import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../blocs/signup/signup_cubit.dart';

class SignupSubmitButton extends StatelessWidget {
  const SignupSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        debugPrint('SignupSubmitButton state.isValid: ${state.isValid}');

        return state.status.isInProgress
            ? const SizedBox(
                height: 50.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : FilledButton(
                key: const Key('signupForm_submit'),
                onPressed: state.isValid
                    ? () {
                        context.read<SignupCubit>().signupWithCredentials(); //.whenComplete(() => context.pop());
                      }
                    : null,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(state.isValid ? Colors.blueAccent : Colors.grey),
                ),
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal),
                ),
              );
      },
    );
  }
}
