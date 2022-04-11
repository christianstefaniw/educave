import 'story_model.dart';
import 'strategies/fetch_stories_strategy.dart';

abstract class IStoriesService {
  List<StoryModel>? get stories;
  Future<void> loadStories();
  void setFetchStoriesStrategy(FetchStoriesStrategy strategy);
}
