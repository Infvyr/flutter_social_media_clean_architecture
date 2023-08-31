import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat/chat_bloc.dart';

class SendInput extends StatefulWidget {
  const SendInput({super.key});

  @override
  State<SendInput> createState() => _SendInputState();
}

class _SendInputState extends State<SendInput> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        if (formKey.currentState!.validate()) {
          setState(() => isDisabled = false);
        }
      },
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Type a message',
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey.shade700,
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          suffixIcon: IconButton(
            onPressed: isDisabled
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      context.read<ChatBloc>().add(
                            ChatUpdateEvent(
                              content: controller.text.trim(),
                            ),
                          );
                      controller.clear();
                    }
                  },
            icon: Icon(
              Icons.send,
              color: isDisabled ? Colors.grey : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        maxLines: 7,
        minLines: 1,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            setState(() => isDisabled = true);
            return '';
          }
          return null;
        },
      ),
    );
  }
}
