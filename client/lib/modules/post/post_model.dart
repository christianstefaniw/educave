class PostModel {
  final String _id;
  int _likes;

  PostModel({required String id, required int likes})
      : _id = id,
        _likes = likes;

  String get id => _id;

  void addLike() {
    _likes++;
  }

  void removeLike() {
    _likes--;
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _likes = json['likes'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['likes'] = _likes;
    return data;
  }
}
