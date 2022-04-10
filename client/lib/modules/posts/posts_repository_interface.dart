import '../post/post_model.dart';

abstract class IPostsRepository {
  Future<List<PostModel>> posts();
}
