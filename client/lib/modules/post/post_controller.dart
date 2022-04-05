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

  String get username => _model.username;
  String get profilePic => _model.profilePic;
  String get content => _model.content;
  String get postedIn => _model.postedIn;
  DateTime get dateTime => _model.dateTime;
  int get commentCount => _model.commentCount;
  int get shareCount => _model.shareCount;
  int get likeCount => _model.likeCount;
  bool get isLiked => _model.isLiked;
  bool get isSaved => _model.isSaved;

  Future<void> like() async {
    await _postRepository.like();
    _model.like();
    notifyListeners();
  }

  Future<void> unlike() async {
    await _postRepository.unlike();
    _model.unlike();
    notifyListeners();
  }

  Future<void> save() async {
    await _postRepository.save();
    _model.save();
    notifyListeners();
  }

  Future<void> unsave() async {
    await _postRepository.unsave();
    _model.unsave();
    notifyListeners();
  }
}
