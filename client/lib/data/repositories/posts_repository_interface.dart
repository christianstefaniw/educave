import '../../core/strategies/fetch_posts/fetch_posts_strategy.dart';
import '../../modules/post/post_model.dart';

abstract class IPostsRepository {
  void setFetchPostsStrategy(FetchPostsStrategy strategy);
  Future<List<PostModel>> posts();
}
