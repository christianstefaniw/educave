import 'package:client/modules/post/post_model.dart';

import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import 'post_repository.dart';

class PostController extends Controller {
  final PostModel model;
  final _postRepository = PostRepository(client: ApiProvider());

  PostController(this.model);

  Future<void> likePost() async {
    await _postRepository.like(model.id);
  }
}
