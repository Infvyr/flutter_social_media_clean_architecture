import 'package:flutter/material.dart';

class VidedoPlayerCaption extends StatelessWidget {
  const VidedoPlayerCaption({
    super.key,
    required this.username,
    required this.caption,
  });

  final String username;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          height: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 5),
              Text(
                caption,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
