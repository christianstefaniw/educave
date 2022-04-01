import '../../core/strategies/fetch_posts/fetch_posts_strategy.dart';
import '../../modules/post/post_model.dart';
import '../providers/api_provider_interface.dart';
import 'posts_repository_interface.dart';

class PostsRepository implements IPostsRepository {
  final IApiProvider client;
  late FetchPostsStrategy _fetchPostsStrategy;

  PostsRepository({required this.client});

  @override
  Future<List<PostModel>> posts() async {
    return _fetchPostsStrategy.execute();
  }

  @override
  void setFetchPostsStrategy(FetchPostsStrategy strategy) {
    _fetchPostsStrategy = strategy;
  }
}
