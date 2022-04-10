import 'package:client/modules/post/post_repository.dart';

import '../../data/providers/api_provider.dart';
import 'post_model.dart';
import 'post_repository_interface.dart';

class PostService {
  final PostModel model;
  final IPostRepository _repository;

  PostService(this.model)
      : _repository = PostRepository(client: ApiProvider(), id: model.id);

  Future<void> like() async {
    await _repository.like();
    model.like();
  }

  Future<void> unlike() async {
    await _repository.unlike();
    model.unlike();
  }

  Future<void> save() async {
    await _repository.save();
    model.save();
  }

  Future<void> unsave() async {
    await _repository.unsave();
    model.unsave();
  }
}
