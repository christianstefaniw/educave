import '../../../data/providers/api_provider_interface.dart';
import '../post/post_model.dart';
import 'posts_repository_interface.dart';
import 'strategies/fetch_posts_strategy.dart';

class PostsRepository implements IPostsRepository {
  final IApiProvider _client;
  final FetchPostsStrategy _fetchPostsStrategy;

  PostsRepository(this._client, {required FetchPostsStrategy fetchStrategy})
      : _fetchPostsStrategy = fetchStrategy;

  @override
  Future<List<PostModel>> posts() async {
    return await _fetchPostsStrategy.execute(_client);
  }
}
