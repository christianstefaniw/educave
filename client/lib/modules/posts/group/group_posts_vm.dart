import '../../posts/strategies/from_group.dart' as fetch_posts;
import '../../stories/stories_service_interface.dart';
import '../../stories/strategies/from_group.dart' as fetch_stories;
import '../abstract_posts_and_stories_vm.dart';
import '../posts_service_interface.dart';

class GroupPostsViewModel extends PostsAndStoriesViewModel {
  final String _groupId;

  GroupPostsViewModel(
      this._groupId, IPostsService postsService, IStoriesService storiesService)
      : super(postsService, storiesService) {
    postsService.setFetchPostsStrategy(fetch_posts.FromGroup(_groupId));
    storiesService.setFetchStoriesStrategy(fetch_stories.FromGroup(_groupId));
  }
}
