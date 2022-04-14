abstract class IUserService {
  String get profilePic;
  String get username;

  Future<void> follow();
  Future<void> unfollow();
}
