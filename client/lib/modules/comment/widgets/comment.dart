import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/colors.dart';
import '../comment_vm.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(vm.profilePic),
            radius: 18,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(
                              fontFamily: 'roboto', letterSpacing: -0.2),
                          children: <TextSpan>[
                            TextSpan(
                              text: vm.username,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: ' ' + vm.content),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        vm.timeSincePost,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontFamily: 'roboto',
                          letterSpacing: -0.2,
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          '${vm.likeCount} likes',
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontFamily: 'roboto',
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Reply',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontFamily: 'roboto',
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: vm.liked ? vm.unlike : vm.like,
              splashRadius: 1,
              color: AppColors.muted,
              iconSize: 15,
              icon: vm.liked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_outline),
            ),
          ),
        ],
      ),
    );
  }
}
