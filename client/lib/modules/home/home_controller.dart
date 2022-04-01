import 'package:client/core/strategies/fetch_posts/from_recent.dart';
import 'package:client/modules/posts/post_model.dart';

import '../../core/interfaces/post_handler.dart';
import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import '../posts/posts_repository.dart';

class HomeController extends Controller implements PostHandler {
  final _postsRepository = PostsRepository(client: ApiProvider());
  late List<PostModel> _posts;

  HomeController() {
    _postsRepository.setFetchPostsStrategy(FromRecent());
  }

  @override
  List<PostModel> get posts => _posts;

  @override
  Future<void> likePost(String id) async {
    await _postsRepository.like(id);
    notifyListeners();
  }

  @override
  Future<void> fetchPosts() async {
    _posts = await _postsRepository.posts();
    notifyListeners();
  }
}
