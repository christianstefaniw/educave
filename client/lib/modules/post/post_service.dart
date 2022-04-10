import 'features/post_feature.dart';
import 'post_model.dart';
import 'post_repository_interface.dart';
import 'post_service_interface.dart';

class PostService implements IPostService {
  final PostModel _model;
  final IPostRepository _repository;

  PostService(this._model, this._repository);
  @override
  String get username => _model.username;

  @override
  String get profilePic => _model.profilePic;

  @override
  String get postedIn => _model.postedIn;

  @override
  DateTime get dateTime => _model.dateTime;

  @override
  int get commentCount => _model.commentCount;

  @override
  int get likeCount => _model.likeCount;

  @override
  bool get isLiked => _model.isLiked;

  @override
  bool get isSaved => _model.isSaved;

  @override
  List<PostFeature> get features => _model.features;

  @override
  Future<void> like() async {
    await _repository.like();
    _model.like();
  }

  @override
  Future<void> unlike() async {
    await _repository.unlike();
    _model.unlike();
  }

  @override
  Future<void> save() async {
    await _repository.save();
    _model.save();
  }

  @override
  Future<void> unsave() async {
    await _repository.unsave();
    _model.unsave();
  }
}
