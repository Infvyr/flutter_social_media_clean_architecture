import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../blocs/login/login_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const SizedBox(
                height: 50.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : FilledButton(
                key: const Key('loginForm_submit'),
                onPressed: state.isValid ? () => context.read<LoginCubit>().loginWithCredentials() : null,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(state.isValid ? Colors.blueAccent : Colors.grey),
                ),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal),
                ),
              );
      },
    );
  }
}
