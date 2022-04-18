import 'package:flutter/material.dart';

import '../story_model.dart';

class StoryPreview extends StatelessWidget {
  final StoryModel _story;
  const StoryPreview(this._story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            _story.url,
            height: double.infinity,
            width: 135,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            backgroundImage: NetworkImage(_story.profilePic),
          ),
        ),
      ],
    );
  }
}
