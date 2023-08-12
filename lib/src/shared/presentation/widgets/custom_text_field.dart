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
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: hintText,
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
