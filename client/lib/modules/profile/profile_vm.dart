import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import '../posts/posts_service_interface.dart';
import '../posts/strategies/from_profile.dart';

class ProfileViewModel with ViewModel {
  final IPostsService _postsService;

  ProfileViewModel(this._postsService) {
    _postsService.setFetchPostsStrategy(FromProfile());
  }

  List<PostModel>? get posts => _postsService.posts;
  bool get postsLoaded => _postsService.posts != null;

  Future<void> loadPosts() async {
    await _postsService.loadPosts();
    notifyListeners();
  }
}
