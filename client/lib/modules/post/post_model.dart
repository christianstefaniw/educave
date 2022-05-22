import 'features/image.dart';
import 'features/post_feature.dart';
import 'features/text.dart';

class PostModel {
  final String _id;
  final String _username;
  final String _profilePic;
  final String _postedIn;
  final DateTime _dateTime;
  final List<PostFeature> _features;
  final int _commentCount;

  int _likeCount;
  bool _isLiked;
  bool _isSaved;

  PostModel({
    required String id,
    required String username,
    required String profilePic,
    required String postedIn,
    required DateTime dateTime,
    required int commentCount,
    required List<PostFeature> features,
    required int likeCount,
    required bool isLiked,
    required bool isSaved,
  })  : _id = id,
        _username = username,
        _profilePic = profilePic,
        _postedIn = postedIn,
        _dateTime = dateTime,
        _commentCount = commentCount,
        _features = features,
        _likeCount = likeCount,
        _isLiked = isLiked,
        _isSaved = isSaved;

  String get id => _id;
  String get username => _username;
  String get profilePic => _profilePic;
  String get postedIn => _postedIn;
  DateTime get dateTime => _dateTime;
  int get commentCount => _commentCount;
  List<PostFeature> get features => _features;
  int get likeCount => _likeCount;
  bool get isLiked => _isLiked;
  bool get isSaved => _isSaved;

  void like() {
    if (_isLiked) return;
    _likeCount++;
    _isLiked = true;
  }

  void unlike() {
    if (!_isLiked) return;
    _likeCount--;
    _isLiked = false;
  }

  void save() {
    if (_isSaved) return;
    _isSaved = true;
  }

  void unsave() {
    if (!_isSaved) return;
    _isSaved = false;
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _username = json['username'],
        _profilePic = json['profilePic'],
        _postedIn = json['postedIn'],
        _dateTime = json['dateTime'],
        _commentCount = json['commentCount'],
        _features = _featuresFromJson(json['features']),
        _likeCount = json['likeCount'],
        _isLiked = json['isLiked'],
        _isSaved = json['isSaved'];

  static List<PostFeature> _featuresFromJson(Map<String, dynamic> json) {
    List<PostFeature> features = [];
    json['image'] ? features.add(ImageFeature(json['image'])) : null;
    json['text'] ? features.add(TextFeature(json['text'])) : null;
    return features;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['profilePic'] = _profilePic;
    data['postedIn'] = _postedIn;
    data['dateTime'] = _dateTime;
    data['commentCount'] = _commentCount;
    data['features'] = _featuresToJson();
    data['likeCount'] = _likeCount;
    data['isLiked'] = _isLiked;
    data['isSaved'] = _isSaved;
    return data;
  }

  List<Map<String, String>> _featuresToJson() {
    List<Map<String, String>> featuresAsJson = [];

    for (PostFeature feature in _features) {
      featuresAsJson.add(<String, String>{feature.type: feature.content});
    }

    return featuresAsJson;
  }
}
