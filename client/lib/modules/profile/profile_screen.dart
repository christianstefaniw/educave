import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../posts/posts_widget.dart';
import 'profile_vm.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context, listen: false).loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = Provider.of<ProfileViewModel>(context);
    return vm.postsLoaded
        ? Posts(vm.posts!)
        : const Center(child: CircularProgressIndicator());
  }

  @override
  bool get wantKeepAlive => true;
}
