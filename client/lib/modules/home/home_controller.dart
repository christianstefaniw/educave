import 'package:client/core/strategies/fetch_posts/from_recent.dart';

import '../../core/interfaces/with_posts.dart';
import '../../data/providers/api_provider.dart';
import '../../data/repositories/posts_repository.dart';
import '../post/post_model.dart';

import '../../core/types/controller.dart';

class HomeController extends Controller implements WithPosts {
  final _postsRepository = PostsRepository(client: ApiProvider());

  HomeController() {
    _postsRepository.setFetchPostsStrategy(FromRecent());
  }

  @override
  Future<List<PostModel>> posts() async {
    return await _postsRepository.posts();
  }
}
