import '../../../data/providers/api_provider_interface.dart';
import '../../../modules/post/post_model.dart';

abstract class FetchPostsStrategy {
  Future<List<PostModel>> execute(IApiProvider client);
}
