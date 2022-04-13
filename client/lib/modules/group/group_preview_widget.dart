import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/colors.dart';
import 'group_screen.dart';
import 'group_vm.dart';

class GroupPreview extends StatelessWidget {
  const GroupPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context, listen: false);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<GroupViewModel>.value(
            value: Provider.of<GroupViewModel>(context),
            child: const Group(),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.light),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(vm.groupPic),
              backgroundColor: Colors.white,
              radius: 25,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vm.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    vm.summary,
                    style: const TextStyle(color: AppColors.heavyMuted),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<GroupViewModel>(builder: (_, vm, __) {
                    return Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: vm.joined ? vm.unjoin : vm.join,
                              iconSize: 22,
                              splashRadius: 1,
                              icon: vm.joined
                                  ? const Icon(
                                      Icons.person,
                                      color: AppColors.success,
                                    )
                                  : const Icon(Icons.person_outline),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 1),
                              width: 27,
                              child: Text(
                                vm.numMembers.toString(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Row(
                          children: [
                            IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              iconSize: 18,
                              splashRadius: 1,
                              icon: const Icon(Icons.chat_bubble_outline),
                            ),
                            const SizedBox(width: 11),
                            SizedBox(
                              width: 27,
                              child: Text(
                                vm.numPosts.toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
