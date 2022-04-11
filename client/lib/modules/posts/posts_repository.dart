import '../../../data/providers/api_provider_interface.dart';
import '../post/post_model.dart';
import 'posts_repository_interface.dart';
import 'strategies/fetch_posts_strategy.dart';

class PostsRepository implements IPostsRepository {
  final IApiProvider _client;
  late FetchPostsStrategy _fetchStrategy;

  PostsRepository(this._client);

  @override
  Future<List<PostModel>> posts() async {
    return await _fetchStrategy.execute(_client);
  }

  @override
  void setFetchPostsStrategy(FetchPostsStrategy strategy) {
    _fetchStrategy = strategy;
  }
}
