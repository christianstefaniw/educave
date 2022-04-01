import '../../modules/posts/post_model.dart';

abstract class PostHandler {
  List<PostModel> get posts;

  Future<void> likePost(String id);
  Future<void> fetchPosts();
}
