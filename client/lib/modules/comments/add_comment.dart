import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/cta_button.dart';
import '../comment/comment_model.dart';
import 'comments_vm.dart';

class AddComment extends StatelessWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentsViewModel>(context, listen: false);
    return CtaButton(
        onPressed: () {
          vm.addComment(
            CommentModel(
              id: '1',
              userId: '1',
              username: 'Christian Stefaniw',
              profilePic:
                  'https://avatars.githubusercontent.com/u/67922410?v=4',
              content: 'Wow so cool!',
              likeCount: 2,
              timeSincePost: 'now',
              liked: false,
            ),
          );
        },
        text: 'Comment');
  }
}
