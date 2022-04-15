import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import '../stories/stories_service_interface.dart';
import '../stories/story_model.dart';
import 'posts_service_interface.dart';

abstract class PostsAndStoriesViewModel with ViewModel {
  final IPostsService _postsService;
  final IStoriesService _storiesService;
  bool _mounted = true;

  PostsAndStoriesViewModel(this._postsService, this._storiesService);

  List<PostModel>? get posts => _postsService.posts;
  List<StoryModel>? get stories => _storiesService.stories;

  Future<void> loadPostsAndStories() async {
    await _postsService.loadPosts();
    await _storiesService.loadStories();
    if (_mounted) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _mounted = false;
  }

  bool get postsAndStoriesLoaded =>
      _postsService.posts != null && _storiesService.stories != null;
}
