import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../group/group_model.dart';
import '../group/group_preview_widget.dart';
import '../group/group_repository.dart';
import '../group/group_service.dart';
import '../group/group_vm.dart';

class Groups extends StatelessWidget {
  final List<GroupModel> _groups;

  const Groups(this._groups, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _groups.length,
      itemBuilder: ((context, index) {
        return ChangeNotifierProvider(
          create: (_) => GroupViewModel(
            GroupService(
              _groups[index],
              GroupRepository(ApiProvider(), groupId: _groups[index].id),
            ),
          ),
          child: const GroupPreview(),
        );
      }),
    );
  }
}
