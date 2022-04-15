import '../group/mutual_group_model.dart';

abstract class IUserService {
  String get profilePic;
  String get username;
  List<MutualGroupModel> get mutualGroups;
  bool get isFollowing;

  Future<void> follow();
  Future<void> unfollow();
}
