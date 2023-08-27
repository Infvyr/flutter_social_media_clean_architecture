import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../blocs/add_content/add_content_cubit.dart';

Future<void> showContentModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add video caption',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Add a caption',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                      onChanged: (caption) => context.read<AddContentCubit>().captionChanged(caption),
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.read<AddContentCubit>().submit(
                        context.read<AuthBloc>().state.user,
                      );
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40))),
                child: const Text('Share'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
