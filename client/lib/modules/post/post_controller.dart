import '../../core/types/controller.dart';
import 'features/post_feature.dart';
import 'post_service.dart';

class PostController with Controller {
  final PostService _service;

  PostController(this._service);

  String get username => _service.model.username;
  String get profilePic => _service.model.profilePic;
  String get postedIn => _service.model.postedIn;
  DateTime get dateTime => _service.model.dateTime;
  int get commentCount => _service.model.commentCount;
  int get likeCount => _service.model.likeCount;
  bool get isLiked => _service.model.isLiked;
  bool get isSaved => _service.model.isSaved;

  List<PostFeature> get features => _service.model.features;

  Future<void> like() async {
    await _service.like();
    notifyListeners();
  }

  Future<void> unlike() async {
    await _service.unlike();
    notifyListeners();
  }

  Future<void> save() async {
    await _service.save();
    notifyListeners();
  }

  Future<void> unsave() async {
    await _service.like();
    notifyListeners();
  }
}
