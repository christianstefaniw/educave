import '../post/post_model.dart';
import '../stories/story_model.dart';

abstract class IHomeService {
  List<PostModel>? get posts;
  List<StoryModel>? get stories;

  Future<void> loadPostsAndStories();

  bool get postsAndStoriesLoaded;
}
