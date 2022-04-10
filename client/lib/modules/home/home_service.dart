import '../post/post_model.dart';
import '../posts/posts_repository_interface.dart';
import '../posts/strategies/from_recent.dart' as fetch_posts;
import '../stories/stories_repository_interface.dart';
import '../stories/story_model.dart';
import '../stories/strategies/from_recent.dart' as fetch_stories;
import 'home_service_interface.dart';

class HomeService implements IHomeService {
  final IPostsRepository _postsRepository;
  final IStoriesRepository _storiesRepository;

  List<PostModel>? _posts;
  List<StoryModel>? _stories;

  HomeService(
      IPostsRepository postsRepository, IStoriesRepository storiesRepository)
      : _postsRepository = postsRepository,
        _storiesRepository = storiesRepository {
    _postsRepository.setFetchPostsStrategy(fetch_posts.FromRecent());
    _storiesRepository.setFetchStoriesStrategy(fetch_stories.FromRecent());
  }

  @override
  List<PostModel>? get posts => _posts;

  @override
  List<StoryModel>? get stories => _stories;

  @override
  Future<void> loadPostsAndStories() async {
    _posts = await _postsRepository.posts();
    _stories = await _storiesRepository.stories();
  }

  @override
  bool get postsAndStoriesLoaded => _posts != null && _stories != null;
}
