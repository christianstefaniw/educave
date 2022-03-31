import '../../../modules/posts/post_model.dart';
import 'fetch_posts_strategy.dart';

class FromGroup extends FetchPostsStrategy {
  @override
  Future<List<PostModel>> execute() async {
    print('from group');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        PostModel(email: 'test@gmail.com'),
      ],
    );
  }
}
