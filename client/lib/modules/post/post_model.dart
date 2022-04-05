class PostModel {
  // dont need getters on these fields for now, tied to the controller
  // may need to change in the near future
  final String id;
  final String username;
  final String profilePic;
  final String content;
  final String postedIn;
  final DateTime dateTime;
  final int commentCount;
  final int shareCount; // this will have to be mutable at some point
  int _likeCount;
  bool _isLiked;
  bool _isSaved;

  PostModel({
    required this.id,
    required this.username,
    required this.profilePic,
    required this.content,
    required this.postedIn,
    required this.dateTime,
    required this.commentCount,
    required this.shareCount,
    required int likeCount,
    required bool isLiked,
    required bool isSaved,
  })  : _likeCount = likeCount,
        _isLiked = isLiked,
        _isSaved = isSaved;

  int get likeCount => _likeCount;
  bool get isLiked => _isLiked;
  bool get isSaved => _isSaved;

  void like() {
    _likeCount++;
    _isLiked = true;
  }

  void unlike() {
    _likeCount--;
    _isLiked = false;
  }

  void save() {
    _isSaved = true;
  }

  void unsave() {
    _isSaved = false;
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        profilePic = json['profilePic'],
        content = json['content'],
        postedIn = json['postedIn'],
        dateTime = json['dateTime'],
        commentCount = json['commentCount'],
        shareCount = json['shareCount'],
        _likeCount = json['likeCount'],
        _isLiked = json['isLiked'],
        _isSaved = json['isSaved'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['profilePic'] = profilePic;
    data['content'] = content;
    data['postedIn'] = postedIn;
    data['dateTime'] = dateTime;
    data['commentCount'] = commentCount;
    data['shareCount'] = shareCount;
    data['likeCount'] = _likeCount;
    data['isLiked'] = _isLiked;
    data['isSaved'] = _isSaved;
    return data;
  }
}
