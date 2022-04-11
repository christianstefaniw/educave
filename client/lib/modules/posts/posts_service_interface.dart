import '../post/post_model.dart';
import 'strategies/fetch_posts_strategy.dart';

abstract class IPostsService {
  List<PostModel>? get posts;

  Future<void> loadPosts();

  void setFetchPostsStrategy(FetchPostsStrategy strategy);
}
