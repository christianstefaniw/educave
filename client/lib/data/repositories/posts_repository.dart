import '../../core/strategies/fetch_posts/fetch_posts_strategy.dart';
import '../../modules/post/post_model.dart';
import '../providers/api_provider_interface.dart';
import 'posts_repository_interface.dart';

class PostsRepository implements IPostsRepository {
  final IApiProvider _client;
  late FetchPostsStrategy _fetchPostsStrategy;

  PostsRepository({required IApiProvider client}) : _client = client;

  @override
  Future<List<PostModel>> posts() async {
    return _fetchPostsStrategy.execute(_client);
  }

  @override
  void setFetchPostsStrategy(FetchPostsStrategy strategy) {
    _fetchPostsStrategy = strategy;
  }
}
