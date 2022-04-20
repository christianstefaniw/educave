import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../abstract_stories_vm.dart';
import 'story_preview.dart';

class StoriesPreview extends StatefulWidget {
  const StoriesPreview({Key? key}) : super(key: key);

  @override
  State<StoriesPreview> createState() => _StoriesPreviewState();
}

class _StoriesPreviewState extends State<StoriesPreview> {
  @override
  void initState() {
    Provider.of<StoriesViewModel>(context, listen: false).loadStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoriesViewModel>(context);

    if (vm.storiesLoaded) {
      return Container(
        height: 180,
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: vm.stories!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: StoryPreview(vm.stories![index]),
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
