class MutualGroupModel {
  final String _id;
  final String _name;

  MutualGroupModel({required String id, required String name})
      : _id = id,
        _name = name;

  String get name => _name;
}
