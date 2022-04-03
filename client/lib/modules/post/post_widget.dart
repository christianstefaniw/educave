import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'post_controller.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostController>(context);

    return Container();
  }
}
