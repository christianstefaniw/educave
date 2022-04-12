import 'package:flutter/material.dart';

import 'group_model.dart';

class Group extends StatelessWidget {
  final GroupModel _model;

  const Group(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_model.name),
    );
  }
}
