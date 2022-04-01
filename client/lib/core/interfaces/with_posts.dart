import 'package:client/modules/post/post_model.dart';

abstract class WithPosts {
  Future<List<PostModel>> posts();
}
