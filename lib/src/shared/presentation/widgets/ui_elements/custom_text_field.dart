import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.errorText,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIconColor,
    this.contentPadding = const EdgeInsets.all(15.0),
    this.focusNode,
  }) : super(key: key);

  final String labelText;
  final String? errorText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffix;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextField(
          autocorrect: false,
          focusNode: focusNode,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: suffix != null ? const EdgeInsets.fromLTRB(15, 15, 45, 15) : contentPadding,
            constraints: const BoxConstraints(maxHeight: 50),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorText: errorText,
            errorStyle: const TextStyle(fontSize: 0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: hintText,
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // suffix: suffix,
            suffixIconColor: suffixIconColor,
          ),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          obscureText: obscureText,
          onChanged: onChanged,
        ),
        if (suffix != null)
          Positioned(
            right: 0,
            child: suffix!,
          ),
      ],
    );
  }
}
