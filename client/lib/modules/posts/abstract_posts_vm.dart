import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import 'posts_service_interface.dart';

abstract class PostsViewModel with ViewModel {
  final IPostsService _service;

  PostsViewModel(this._service);

  List<PostModel>? get posts => _service.posts;

  Future<void> loadPosts() async {
    await _service.loadPosts();
    notifyListeners();
  }

  bool get postsLoaded => _service.posts != null;
}
