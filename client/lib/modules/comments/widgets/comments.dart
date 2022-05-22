import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/api_provider.dart';
import '../../comment/comment_model.dart';
import '../../comment/comment_repository.dart';
import '../../comment/comment_vm.dart';
import '../../comment/comment_widget.dart';
import '../comments_vm.dart';
import 'add_comment.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    Provider.of<CommentsViewModel>(context, listen: false).loadComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentsViewModel>(context);

    if (vm.comments != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: vm.comments!.length,
                  itemBuilder: ((context, index) {
                    return ChangeNotifierProvider(
                      create: (_) => CommentViewModel(
                        CommentRepository(
                          vm.comments![index].id,
                          ApiProvider(),
                        ),
                        vm.comments![index],
                      ),
                      child: const Comment(),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AddComment()
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
