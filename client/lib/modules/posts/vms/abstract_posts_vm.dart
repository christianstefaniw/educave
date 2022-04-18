import '../../../core/types/view_model.dart';
import '../../post/post_model.dart';
import '../posts_service_interface.dart';

abstract class PostsViewModel with ViewModel {
  final IPostsService _service;
  bool _mounted = true;

  PostsViewModel(this._service);

  Future<void> loadPosts() async {
    if (_mounted) {
      await _service.loadPosts();
      notifyListeners();
    }
  }

  bool get postsLoaded => _service.posts != null;

  List<PostModel>? get posts => _service.posts;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
