import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../constants/index.dart';
import '../../../../shared/presentation/index.dart';
import '../blocs/add_content/add_content_cubit.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  Future<File?> handleVideoUpload() async {
    try {
      XFile? video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );
      if (video == null) {
        return null;
      }
      final directory = await getApplicationDocumentsDirectory();
      final fileName = basename(video.path);
      final savedVideo = await File(video.path).copy('${directory.path}/$fileName');
      return savedVideo;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * 0.35,
      ),
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
                    context.read<AddContentCubit>().submit();
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddContentCubit, AddContentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add content'),
            centerTitle: true,
            actions: [
              state.video != null
                  ? IconButton(
                      onPressed: () => context.read<AddContentCubit>().reset(),
                      icon: const Icon(Icons.restore_rounded),
                    )
                  : const SizedBox.shrink(),
            ],
            leading: IconButton(
              onPressed: () {
                context.goNamed(AppRoutes.feed.name);
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          body: state.video == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have not selected a video yet! 🤔',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: () async {
                            await handleVideoUpload().then((video) {
                              if (video != null) {
                                context.read<AddContentCubit>().videoChanged(video);
                              }
                            });
                          },
                          child: const Text('Select a video'),
                        ),
                      ],
                    ),
                  ),
                )
              : state.video != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        VideoPlayerItem(assetPath: state.video!.path),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: SafeArea(
                            child: FilledButton(
                              onPressed: () => _showModalBottomSheet(context),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.8)),
                                foregroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.8)),
                              ),
                              child: const Text('Add a caption'),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text('Something went wrong!'),
                    ),
        );
      },
    );
  }
}
