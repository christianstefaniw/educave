import '../../core/types/controller.dart';
import '../post/post_model.dart';
import '../posts/posts_service_interface.dart';
import '../stories/stories_service_interface.dart';
import '../stories/story_model.dart';

class HomeController with Controller {
  final IPostsService _postsService;
  final IStoriesService _storiesService;

  HomeController(this._postsService, this._storiesService);

  List<PostModel>? get posts => _postsService.posts;
  List<StoryModel>? get stories => _storiesService.stories;

  Future<void> loadPostsAndStories() async {
    await _postsService.loadPosts();
    await _storiesService.loadStories();
    notifyListeners();
  }

  bool get postsAndStoriesLoaded =>
      _postsService.posts != null && _storiesService.stories != null;
}
