class PostModel {
  late String _id;

  PostModel({required String id}) {
    _id = id;
  }

  String get id => _id;

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    return data;
  }
}
