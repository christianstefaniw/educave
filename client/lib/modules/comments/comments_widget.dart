import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/api_provider.dart';
import '../comment/comment_repository.dart';
import '../comment/comment_service.dart';
import '../comment/comment_vm.dart';
import '../comment/comment_widget.dart';
import 'comments_vm.dart';

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

    if (vm.commentsLoaded) {
      return ListView.builder(
        itemCount: vm.comments!.length,
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider(
            create: (_) => CommentViewModel(
              CommentService(
                vm.comments![index],
                CommentRepository(
                  vm.comments![index].id,
                  ApiProvider(),
                ),
              ),
            ),
            child: const Comment(),
          );
        }),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
