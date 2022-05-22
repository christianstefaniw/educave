import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../data/providers/api_provider.dart';
import '../../comment/comment_model.dart';
import '../../comment/comment_repository.dart';
import '../../comment/comment_vm.dart';
import '../../comment/comment_widget.dart';
import 'add_comment.dart';
import '../comments_vm.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      child: Column(
        children: [
          Selector<CommentsViewModel, List<CommentModel>?>(
            selector: (_, vm) => vm.comments,
            builder: ((context, comments, child) {
              if (comments != null) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: ((context, index) {
                      return ChangeNotifierProvider(
                        create: (_) => CommentViewModel(
                          CommentRepository(
                            comments[index].id,
                            ApiProvider(),
                          ),
                          comments[index],
                        ),
                        child: const Comment(),
                      );
                    }),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          const AddComment(),
        ],
      ),
    );
  }
}
