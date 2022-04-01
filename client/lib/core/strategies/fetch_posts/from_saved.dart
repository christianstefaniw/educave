import 'package:flutter/foundation.dart';

import '../../../modules/post/post_model.dart';
import 'fetch_posts_strategy.dart';

class FromSaved extends FetchPostsStrategy {
  @override
  Future<List<PostModel>> execute() async {
    debugPrint('from saved');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        PostModel(id: '4'),
      ],
    );
  }
}
