import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/index.dart';
import '../../../../../shared/presentation/index.dart';
import '../../blocs/login/login_cubit.dart';

class UserPassword extends StatefulWidget {
  const UserPassword({super.key});

  @override
  State<UserPassword> createState() => _UserPasswordState();
}

class _UserPasswordState extends State<UserPassword> {
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return previous.password != current.password;
      },
      builder: (context, state) {
        return CustomTextField(
          key: const Key('loginForm_password'),
          labelText: 'Password',
          hintText: 'Enter your password',
          obscureText: isObscure,
          focusNode: focusNode,
          errorText: state.password.displayError != null ? '' : null,
          onChanged: (password) => context.read<LoginCubit>().onPasswordChanged(password),
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
