import 'package:client/modules/posts/post_model.dart';

abstract class FetchPostsStrategy {
  Future<List<PostModel>> execute();
}
