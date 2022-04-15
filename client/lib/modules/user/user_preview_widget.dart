import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/colors.dart';
import 'user_vm.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.outline),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 19,
            backgroundImage: NetworkImage(vm.profilePic),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vm.username,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                vm.mutualGroups.map((e) => '${e.name}, ').join(),
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
