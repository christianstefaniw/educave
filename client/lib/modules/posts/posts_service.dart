import '../post/post_model.dart';
import 'posts_repository_interface.dart';
import 'posts_service_interface.dart';

class PostsService implements IPostsService {
  final IPostsRepository _repository;
  List<PostModel>? _posts;

  PostsService(this._repository);

  @override
  Future<void> loadPosts() async {
    _posts = await _repository.posts();
  }

  @override
  List<PostModel>? get posts => _posts;
}
