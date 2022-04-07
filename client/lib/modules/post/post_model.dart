import 'features/image.dart';
import 'features/post_feature.dart';
import 'features/text.dart';

class PostModel {
  final String id;
  final String username;
  final String profilePic;
  final String postedIn;
  final DateTime dateTime;
  final int commentCount;
  final List<PostFeature> features;

  int _likeCount;
  bool _isLiked;
  bool _isSaved;

  PostModel({
    required this.id,
    required this.username,
    required this.profilePic,
    required this.postedIn,
    required this.dateTime,
    required this.commentCount,
    required this.features,
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
        postedIn = json['postedIn'],
        dateTime = json['dateTime'],
        commentCount = json['commentCount'],
        features = _featuresFromJson(json['features']),
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['profilePic'] = profilePic;
    data['postedIn'] = postedIn;
    data['dateTime'] = dateTime;
    data['commentCount'] = commentCount;
    data['features'] = _featuresToJson();
    data['likeCount'] = _likeCount;
    data['isLiked'] = _isLiked;
    data['isSaved'] = _isSaved;
    return data;
  }

  List<Map<String, String>> _featuresToJson() {
    List<Map<String, String>> featuresAsJson = [];

    for (PostFeature feature in features) {
      featuresAsJson.add(<String, String>{feature.type: feature.content});
    }

    return featuresAsJson;
  }
}
