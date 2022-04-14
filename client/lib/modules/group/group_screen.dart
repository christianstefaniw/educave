import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/safearea.dart';
import '../posts/posts_widget.dart';
import 'group_vm.dart';

class Group extends StatefulWidget {
  const Group({Key? key}) : super(key: key);

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  void initState() {
    Provider.of<GroupViewModel>(context, listen: false).loadPostsAndStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GroupViewModel>(context);

    return MySafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            vm.postsAndStoriesLoaded
                ? Posts(vm.posts!, stories: vm.stories!)
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    );
  }
}
