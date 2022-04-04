class PostModel {
  final String _id;
  final String _username;
  final String _profilePic;
  final String _content;
  final String _postedIn;
  final DateTime _dateTime;
  final int _commentCount;
  final int _shareCount;
  int _likeCount;
  bool _saved;

  PostModel({
    required String id,
    required String username,
    required String profilePic,
    required String content,
    required String postedIn,
    required DateTime dateTime,
    required int commentCount,
    required int shareCount,
    required int likeCount,
    required bool saved,
  })  : _id = id,
        _username = username,
        _profilePic = profilePic,
        _content = content,
        _postedIn = postedIn,
        _dateTime = dateTime,
        _commentCount = commentCount,
        _shareCount = shareCount,
        _saved = saved,
        _likeCount = likeCount;

  String get id => _id;
  String get username => _username;
  String get profilePic => _profilePic;
  String get content => _content;
  String get postedIn => _postedIn;
  DateTime get dateTime => _dateTime;
  int get commentCount => _commentCount;
  int get shareCount => _shareCount;
  int get likeCount => _likeCount;
  bool get saved => _saved;

  void addLike() {
    _likeCount++;
  }

  void removeLike() {
    _likeCount--;
  }

  void save() {
    _saved = true;
  }

  void unsave() {
    _saved = false;
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _username = json['username'],
        _profilePic = json['profilePic'],
        _content = json['content'],
        _postedIn = json['postedIn'],
        _dateTime = json['dateTime'],
        _commentCount = json['commentCount'],
        _shareCount = json['shareCount'],
        _saved = json['saved'],
        _likeCount = json['_likeCount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['profilePic'] = _profilePic;
    data['content'] = _content;
    data['postedIn'] = _postedIn;
    data['dateTime'] = _dateTime;
    data['commentCount'] = _commentCount;
    data['shareCount'] = _shareCount;
    data['saved'] = _saved;
    data['_likeCount'] = _likeCount;
    return data;
  }
}
