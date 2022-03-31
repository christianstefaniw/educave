import 'package:client/core/strategies/fetch_posts/fetch_posts_strategy.dart';
import 'package:client/core/strategies/fetch_posts/from_recent.dart';
import 'package:client/modules/posts/post_model.dart';

import '../../data/providers/api_provider_interface.dart';
import 'posts_repository_interface.dart';

class PostsRepository implements IPostsRepository {
  final IApiProvider client;
  FetchPostsStrategy _fetchPostsStrategy = FromRecent();

  PostsRepository({required this.client});

  @override
  Future<List<PostModel>> fetchPosts() async {
    return _fetchPostsStrategy.execute();
  }

  @override
  Future<void> like(String id) async {}

  @override
  void setFetchPostsStrategy(FetchPostsStrategy strategy) {
    _fetchPostsStrategy = strategy;
  }
}
