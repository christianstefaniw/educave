import '../../core/strategies/fetch_stories/fetch_stories_strategy.dart';
import 'story_model.dart';

abstract class IStoriesRepository {
  Future<List<StoryModel>> stories();
  void setFetchStoriesStrategy(FetchStoriesStrategy strategy);
}
