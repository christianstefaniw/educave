import 'package:client/data/repositories/posts_repository_interface.dart';

import '../../core/interfaces/with_posts.dart';
import '../../core/strategies/fetch_posts/from_recent.dart';
import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import '../../data/repositories/posts_repository.dart';
import '../post/post_model.dart';

class HomeController extends Controller implements WithPosts {
  final IPostsRepository _postsRepository =
      PostsRepository(client: ApiProvider());

  HomeController() {
    _postsRepository.setFetchPostsStrategy(FromRecent());
  }

  @override
  Future<List<PostModel>> posts() async {
    return await _postsRepository.posts();
  }
}
