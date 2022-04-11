import '../../data/providers/api_provider.dart';
import '../post/post_model.dart';
import 'posts_repository.dart';
import 'posts_repository_interface.dart';
import 'posts_service_interface.dart';
import 'strategies/fetch_posts_strategy.dart';

class PostsService implements IPostsService {
  final IPostsRepository _repository = PostsRepository(ApiProvider());
  List<PostModel>? _posts;

  @override
  Future<void> loadPosts() async {
    _posts = await _repository.posts();
  }

  @override
  List<PostModel>? get posts => _posts;

  @override
  void setFetchPostsStrategy(FetchPostsStrategy strategy) {
    _repository.setFetchPostsStrategy(strategy);
  }
}
