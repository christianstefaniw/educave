import 'features/post_feature.dart';

abstract class IPostService {
  String get username;
  String get profilePic;
  String get postedIn;
  DateTime get dateTime;
  int get commentCount;
  int get likeCount;
  bool get isLiked;
  bool get isSaved;
  List<PostFeature> get features;

  Future<void> like();
  Future<void> unlike();

  Future<void> save();
  Future<void> unsave();
}
