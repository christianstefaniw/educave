import 'package:flutter/material.dart';

import '../../core/types/view_model.dart';
import 'stories_service_interface.dart';
import 'story_model.dart';

abstract class StoriesViewModel with ViewModel {
  @protected
  final IStoriesService service;
  bool _mounted = true;

  StoriesViewModel(this.service);

  List<StoryModel>? get stories => service.stories;

  Future<void> loadStories() async {
    await service.loadStories();
    if (_mounted) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _mounted = false;
  }

  bool get storiesLoaded => service.stories != null;
}
