import '../post/post_model.dart';
import 'strategies/fetch_posts_strategy.dart';

abstract class IPostsRepository {
  void setFetchPostsStrategy(FetchPostsStrategy strategy);
  Future<List<PostModel>> posts();
}
