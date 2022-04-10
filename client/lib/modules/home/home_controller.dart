import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import '../post/post_model.dart';
import '../posts/posts_repository.dart';
import '../posts/posts_repository_interface.dart';
import '../posts/strategies/from_recent.dart' as fetch_posts;
import '../stories/stories_repository.dart';
import '../stories/stories_repository_interface.dart';
import '../stories/story_model.dart';
import '../stories/strategies/from_recent.dart' as fetch_stories;

class HomeController with Controller {
  final IPostsRepository _postsRepository =
      PostsRepository(client: ApiProvider());

  final IStoriesRepository _storiesRepository =
      StoriesRepository(client: ApiProvider());

  List<PostModel>? _posts;
  List<StoryModel>? _stories;

  HomeController() {
    _postsRepository.setFetchPostsStrategy(fetch_posts.FromRecent());
    _storiesRepository.setFetchStoriesStrategy(fetch_stories.FromRecent());
  }

  List<PostModel>? get posts => _posts;
  List<StoryModel>? get stories => _stories;

  Future<void> loadPostsAndStories() async {
    _posts = await _postsRepository.posts();
    _stories = await _storiesRepository.stories();
    notifyListeners();
  }

  bool get postsAndStoriesLoaded => _posts != null && _stories != null;
}
