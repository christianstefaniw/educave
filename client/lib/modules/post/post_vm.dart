import '../../core/types/view_model.dart';
import 'features/post_feature.dart';
import 'post_model.dart';
import 'post_repository_interface.dart';

class PostViewModel with ViewModel {
  final IPostRepository _repository;
  final PostModel _model;

  PostViewModel(this._repository, this._model);

  String get username => _model.username;
  String get profilePic => _model.profilePic;
  String get postedIn => _model.postedIn;
  DateTime get dateTime => _model.dateTime;
  int get commentCount => _model.commentCount;
  int get likeCount => _model.likeCount;
  bool get isLiked => _model.isLiked;
  bool get isSaved => _model.isSaved;
  List<PostFeature> get features => _model.features;

  void like() {
    _repository.like();
    _model.like();
    notifyListeners();
  }

  void unlike() {
    _repository.unlike();
    _model.unlike();
    notifyListeners();
  }

  void save() {
    _repository.save();
    _model.save();
    notifyListeners();
  }

  void unsave() {
    _repository.unsave();
    _model.unsave();
    notifyListeners();
  }
}
