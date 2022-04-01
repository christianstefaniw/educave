import '../../../modules/post/post_model.dart';

abstract class FetchPostsStrategy {
  Future<List<PostModel>> execute();
}
