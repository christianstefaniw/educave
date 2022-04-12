import '../../core/types/view_model.dart';
import 'features/post_feature.dart';
import 'post_service_interface.dart';

class PostViewModel with ViewModel {
  final IPostService _service;

  PostViewModel(this._service);

  String get username => _service.username;
  String get profilePic => _service.profilePic;
  String get postedIn => _service.postedIn;
  DateTime get dateTime => _service.dateTime;
  int get commentCount => _service.commentCount;
  int get likeCount => _service.likeCount;
  bool get isLiked => _service.isLiked;
  bool get isSaved => _service.isSaved;
  List<PostFeature> get features => _service.features;

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
    await _service.unsave();
    notifyListeners();
  }
}
