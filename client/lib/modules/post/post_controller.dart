import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import 'post_model.dart';
import 'post_repository.dart';
import 'post_repository_interface.dart';

class PostController extends Controller {
  final PostModel _model;
  final IPostRepository _postRepository;

  PostController(PostModel model)
      : _model = model,
        _postRepository = PostRepository(client: ApiProvider(), id: model.id);

  Future<void> like() async {
    await _postRepository.like();
    _model.addLike();
    notifyListeners();
  }

  Future<void> unlike() async {
    await _postRepository.unlike();
    _model.removeLike();
    notifyListeners();
  }
}
