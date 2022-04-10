import 'story_model.dart';

abstract class IStoriesService {
  List<StoryModel>? get stories;
  Future<void> loadStories();
}
