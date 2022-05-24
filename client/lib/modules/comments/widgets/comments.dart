import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/api_provider.dart';
import '../../account/account_provider.dart';
import '../../add_comment/account_data.dart';
import '../../add_comment/add_comment_repository.dart';
import '../../add_comment/add_comment_vm.dart';
import '../../comment/comment_repository.dart';
import '../../comment/comment_vm.dart';
import '../../comment/comment_widget.dart';
import '../comments_vm.dart';
import '../../add_comment/add_comment_widget.dart';

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
    final account = Provider.of<AccountProvider>(context, listen: false);

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
                  itemCount: vm.comments!.getState().length,
                  itemBuilder: ((context, index) {
                    return ChangeNotifierProvider(
                      create: (_) => CommentViewModel(
                        CommentRepository(
                          vm.comments!.getState()[index].id,
                          ApiProvider(),
                        ),
                        vm.comments!.getState()[index],
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
            ChangeNotifierProvider(
              create: (_) => AddCommentViewModel(
                AddCommentRepository(ApiProvider()),
                comments: vm.comments!,
                accountCommentData: AccountCommentData(
                  account.id,
                  account.profilePic,
                  account.name,
                ),
              ),
              child: const AddComment(),
            )
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
