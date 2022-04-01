import '../../core/types/controller.dart';
import '../../data/providers/api_provider.dart';
import 'post_model.dart';
import 'post_repository.dart';

class PostController extends Controller {
  final PostModel _model;
  final _postRepository = PostRepository(client: ApiProvider());

  PostController(PostModel model) : _model = model;

  Future<void> likePost() async {
    await _postRepository.like(_model.id);
  }
}
