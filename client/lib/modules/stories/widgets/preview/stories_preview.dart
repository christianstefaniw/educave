import 'package:flutter/material.dart';

import '../../story_model.dart';
import 'story_preview.dart';

class StoriesPreview extends StatelessWidget {
  final List<StoryModel> _stories;
  const StoriesPreview(this._stories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: StoryPreview(_stories[index]),
          );
        },
      ),
    );
  }
}
