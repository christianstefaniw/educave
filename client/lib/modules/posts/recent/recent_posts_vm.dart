import '../../posts/posts_service_interface.dart';
import '../../posts/strategies/from_recent.dart' as fetch_posts;
import '../../stories/stories_service_interface.dart';
import '../../stories/strategies/from_recent.dart' as fetch_stories;
import '../abstract_posts_and_stories_vm.dart';

class RecentPostsViewModel extends PostsAndStoriesViewModel {
  RecentPostsViewModel(
      IPostsService _postsService, IStoriesService _storiesService)
      : super(_postsService, _storiesService) {
    _postsService.setFetchPostsStrategy(fetch_posts.FromRecent());
    _storiesService.setFetchStoriesStrategy(fetch_stories.FromRecent());
  }
}
