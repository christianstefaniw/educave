import '../../core/validators/text.dart';
import 'comment_repository_interface.dart';

class CommentModel {
  final String _id;
  final String _userId;
  final String _username;
  final String _profilePic;
  final String _content;
  final String _timeSincePost;
  final ICommentRepository _repository;

  int _likeCount;
  bool _liked;

  CommentModel(this._repository,
      {required String id,
      required String userId,
      required String username,
      required String profilePic,
      required String content,
      required int likeCount,
      required bool liked,
      required String timeSincePost})
      : _id = id,
        _userId = userId,
        _username = username,
        _profilePic = profilePic,
        _content = content,
        _likeCount = likeCount,
        _liked = liked,
        _timeSincePost = timeSincePost {
    validate(content);
  }

  factory CommentModel.create(
    ICommentRepository repository,
    String content,
    String userId,
    String profilePic,
    String username,
  ) {
    return CommentModel(
      repository,
      id: 'id',
      userId: userId,
      username: username,
      profilePic: profilePic,
      content: content,
      likeCount: 0,
      liked: false,
      timeSincePost: 'now',
    );
  }

  static void validate(String content) {
    Map<String, String> validationErrors = {};

    final contentError = validateText(content, minLength: 1);

    if (contentError != null) validationErrors['content'] = contentError;

    if (validationErrors.isNotEmpty) throw validationErrors;
  }

  String get id => _id;
  String get username => _username;
  String get profilePic => _profilePic;
  String get content => _content;
  int get likeCount => _likeCount;
  bool get liked => _liked;
  String get timeSincePost => _timeSincePost;

  void like() async {
    if (_liked) return;
    _likeCount++;
    _liked = true;

    await _repository.like();
  }

  void unlike() async {
    if (!_liked) return;
    _likeCount--;
    _liked = false;

    await _repository.unlike();
  }
}
