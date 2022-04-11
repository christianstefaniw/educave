import '../../data/providers/api_provider.dart';
import 'stories_repository.dart';
import 'stories_repository_interface.dart';
import 'stories_service_interface.dart';
import 'story_model.dart';
import 'strategies/fetch_stories_strategy.dart';

class StoriesService implements IStoriesService {
  final IStoriesRepository _repository = StoriesRepository(ApiProvider());

  List<StoryModel>? _stories;

  @override
  List<StoryModel>? get stories => _stories;

  @override
  Future<void> loadStories() async {
    _stories = await _repository.stories();
  }

  @override
  void setFetchStoriesStrategy(FetchStoriesStrategy strategy) {
    _repository.setFetchStoriesStrategy(strategy);
  }
}
