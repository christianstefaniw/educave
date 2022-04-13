import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/colors.dart';
import 'group_vm.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context);

    return Container(
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
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          iconSize: 22,
                          splashRadius: 1,
                          icon: const Icon(Icons.person_outline),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 9, top: 2),
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
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          child: Text(
                            vm.numMembers.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
