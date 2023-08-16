import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/index.dart';
import '../../../../../shared/presentation/index.dart';
import '../../blocs/signup/signup_cubit.dart';

class SignupUserPassword extends StatefulWidget {
  const SignupUserPassword({super.key});

  @override
  State<SignupUserPassword> createState() => _SignupUserPasswordState();
}

class _SignupUserPasswordState extends State<SignupUserPassword> {
  late FocusNode focusNode;
  bool isInFocus = false;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void onFocusChange() {
    setState(() => isInFocus = focusNode.hasPrimaryFocus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) {
        return previous.password != current.password;
      },
      builder: (context, state) {
        return CustomTextField(
          key: const Key('signupForm_password'),
          labelText: 'Password',
          hintText: 'Enter your password',
          obscureText: isObscure,
          focusNode: focusNode,
          errorText: state.password.displayError != null ? '' : null,
          onChanged: (password) => context.read<SignupCubit>().onPasswordChanged(password),
          suffix: IconButton(
            icon: isInFocus
                ? Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility_off,
                    color: Colors.grey.shade400,
                    size: 20,
                  )
                : Icon(
                    Icons.info,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
            onPressed: () {
              if (!isInFocus) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.passwordHelperText),
                    ), // state.errorMessage
                  );
              } else {
                setState(() => isObscure = !isObscure);
              }
            },
          ),
        );
      },
    );
  }
}
