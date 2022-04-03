import 'package:flutter/foundation.dart';

import '../../../data/providers/api_provider_interface.dart';
import '../../../modules/post/post_model.dart';
import 'fetch_posts_strategy.dart';

class FromRecent implements FetchPostsStrategy {
  @override
  Future<List<PostModel>> execute(IApiProvider client) async {
    debugPrint('from recent');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        PostModel(id: '3', likes: 0),
      ],
    );
  }
}
