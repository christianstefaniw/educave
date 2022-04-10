import '../../modules/stories/story_model.dart';

abstract class WithStories {
  Future<List<StoryModel>> stories();
}
