import '../../data/providers/api_provider_interface.dart';
import 'stories_repository_interface.dart';
import 'story_model.dart';
import 'strategies/fetch_stories_strategy.dart';

class StoriesRepository implements IStoriesRepository {
  final IApiProvider _client;
  final FetchStoriesStrategy _fetchStoriesStrategy;

  StoriesRepository(this._client, {required FetchStoriesStrategy fetchStrategy})
      : _fetchStoriesStrategy = fetchStrategy;

  @override
  Future<List<StoryModel>> stories() async {
    return await _fetchStoriesStrategy.execute(_client);
  }
}
