import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import '../posts/posts_service_interface.dart';
import '../posts/strategies/from_recent.dart' as fetch_posts;
import '../stories/stories_service_interface.dart';
import '../stories/story_model.dart';
import '../stories/strategies/from_recent.dart' as fetch_stories;

class HomeViewModel with ViewModel {
  final IPostsService _postsService;
  final IStoriesService _storiesService;

  HomeViewModel(this._postsService, this._storiesService) {
    _postsService.setFetchPostsStrategy(fetch_posts.FromRecent());
    _storiesService.setFetchStoriesStrategy(fetch_stories.FromRecent());
  }

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