import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../data/providers/api_provider.dart';
import '../../comment/comment_model.dart';
import '../../comment/comment_repository.dart';
import '../../comment/comment_service.dart';
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
          Selector<CommentsViewModel, Tuple2<List<CommentModel>?, bool>>(
            selector: (_, vm) => Tuple2(vm.comments, vm.commentsLoaded),
            builder: ((context, data, child) {
              if (data.item2) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.item1!.length,
                    itemBuilder: ((context, index) {
                      return ChangeNotifierProvider(
                        create: (_) => CommentViewModel(
                          CommentService(
                            data.item1![index],
                            CommentRepository(
                              data.item1![index].id,
                              ApiProvider(),
                            ),
                          ),
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
