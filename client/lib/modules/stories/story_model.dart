class StoryModel {
  final String _profileId;
  final String _profilePic;
  final String _url;

  String get profilePic => _profilePic;
  String get url => _url;

  StoryModel(
      {required String profileId,
      required String profilePic,
      required String url})
      : _profileId = profileId,
        _profilePic = profilePic,
        _url = url;

  StoryModel.fromJson(Map<String, dynamic> json)
      : _profileId = json['profileId'],
        _profilePic = json['profilePic'],
        _url = json['url'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['profileId'] = _profileId;
    json['profilePic'] = _profilePic;
    json['url'] = _url;
    return json;
  }
}
