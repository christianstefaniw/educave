import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import '../posts/posts_service_interface.dart';
import '../posts/strategies/from_group.dart' as fetch_posts;
import '../stories/stories_service_interface.dart';
import '../stories/story_model.dart';
import '../stories/strategies/from_group.dart' as fetch_stories;
import 'group_service_interface.dart';

class GroupViewModel with ViewModel {
  final IGroupService _service;
  final IPostsService _postsService;
  final IStoriesService _storiesService;

  GroupViewModel(this._service, this._postsService, this._storiesService) {
    _postsService.setFetchPostsStrategy(fetch_posts.FromGroup(_service.id));
    _storiesService
        .setFetchStoriesStrategy(fetch_stories.FromGroup(_service.id));
  }

  String get groupPic => _service.groupPic;
  String get name => _service.name;
  String get summary => _service.summary;
  int get numMembers => _service.numMembers;
  int get numPosts => _service.numPosts;
  bool get joined => _service.joined;

  List<PostModel>? get posts => _postsService.posts;
  List<StoryModel>? get stories => _storiesService.stories;

  Future<void> loadPostsAndStories() async {
    await _postsService.loadPosts();
    await _storiesService.loadStories();
    notifyListeners();
  }

  bool get postsAndStoriesLoaded =>
      _postsService.posts != null && _storiesService.stories != null;

  Future<void> join() async {
    await _service.join();
    notifyListeners();
  }

  Future<void> unjoin() async {
    await _service.unjoin();
    notifyListeners();
  }
}
