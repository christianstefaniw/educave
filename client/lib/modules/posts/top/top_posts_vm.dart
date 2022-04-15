import '../../../core/types/view_model.dart';
import '../../post/post_model.dart';
import '../posts_service_interface.dart';
import '../strategies/top.dart';

class TopPostsViewModel with ViewModel {
  final IPostsService _service;

  TopPostsViewModel(this._service) {
    _service.setFetchPostsStrategy(FromTop());
  }

  List<PostModel>? get posts => _service.posts;

  Future<void> loadPosts() async {
    await _service.loadPosts();
    notifyListeners();
  }

  bool get postsLoaded => _service.posts != null;
}
