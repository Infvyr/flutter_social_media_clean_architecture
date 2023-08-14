// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  }) : super(key: key);

  final String labelText;
  final String? errorText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorText: errorText,
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
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
