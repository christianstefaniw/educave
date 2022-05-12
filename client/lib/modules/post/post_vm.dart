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

  void like() {
    var res = _service.like();
    notifyListeners();
    // if ((await res) is fail) then
  }

  void unlike() {
    _service.unlike();
    notifyListeners();
  }

  void save() {
    _service.save();
    notifyListeners();
  }

  void unsave() {
    _service.unsave();
    notifyListeners();
  }
}
