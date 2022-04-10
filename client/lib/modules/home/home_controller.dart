import '../../core/types/controller.dart';
import '../post/post_model.dart';
import '../stories/story_model.dart';
import 'home_service_interface.dart';

class HomeController with Controller {
  final IHomeService _service;

  HomeController(this._service);

  List<PostModel>? get posts => _service.posts;
  List<StoryModel>? get stories => _service.stories;

  Future<void> loadPostsAndStories() async {
    await _service.loadPostsAndStories();
    notifyListeners();
  }

  bool get postsAndStoriesLoaded =>
      _service.posts != null && _service.stories != null;
}
