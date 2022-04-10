import '../../core/interfaces/with_posts.dart';
import '../../core/interfaces/with_stories.dart';
import '../../core/strategies/fetch_posts/from_recent.dart' as fetch_posts;
import '../../core/strategies/fetch_stories/from_recent.dart' as fetch_stories;
import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import '../../data/repositories/posts_repository.dart';
import '../../data/repositories/posts_repository_interface.dart';
import '../post/post_model.dart';
import '../stories/stories_repository.dart';
import '../stories/stories_repository_interface.dart';
import '../stories/story_model.dart';

class HomeController with Controller implements WithPosts, WithStories {
  final IPostsRepository _postsRepository =
      PostsRepository(client: ApiProvider());

  final IStoriesRepository _storiesRepository =
      StoriesRepository(client: ApiProvider());

  HomeController() {
    _postsRepository.setFetchPostsStrategy(fetch_posts.FromRecent());
    _storiesRepository.setFetchStoriesStrategy(fetch_stories.FromRecent());
  }

  @override
  Future<List<PostModel>> posts() async {
    return await _postsRepository.posts();
  }

  @override
  Future<List<StoryModel>> stories() async {
    return await _storiesRepository.stories();
  }
}
