import 'package:client/core/strategies/fetch_posts/fetch_posts_strategy.dart';
import 'package:client/modules/posts/post_model.dart';

abstract class IPostsRepository {
  void setFetchPostsStrategy(FetchPostsStrategy strategy);
  Future<List<PostModel>> posts();
  Future<void> like(String id);
}
