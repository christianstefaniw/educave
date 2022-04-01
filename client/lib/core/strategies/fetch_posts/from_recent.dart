import 'package:flutter/foundation.dart';

import '../../../modules/posts/post_model.dart';
import 'fetch_posts_strategy.dart';

class FromRecent implements FetchPostsStrategy {
  @override
  Future<List<PostModel>> execute() async {
    debugPrint('from recent');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        PostModel(email: 'test@gmail.com'),
      ],
    );
  }
}
