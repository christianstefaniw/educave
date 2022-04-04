import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/date_time_format.dart';
import '../../core/theme/theme.dart';
import 'post_controller.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PostController>(context);
    final post = controller.post;

    return Container(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.profilePic),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.username),
                  Text(
                    post.postedIn,
                    style: const TextStyle(color: AppColors.muted),
                  )
                ],
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.more_vert,
                    color: AppColors.muted,
                  ),
                ),
              )
            ],
          ),
          Text(post.content),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateTimeFormat.monthDayYear.format(post.dateTime).toString(),
              style: const TextStyle(color: AppColors.muted),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
