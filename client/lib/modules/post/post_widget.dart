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

    return Container(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(controller.profilePic),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.username),
                  Text(
                    controller.postedIn,
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
          Text(controller.content),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateTimeFormat.monthDayYear
                  .format(controller.dateTime)
                  .toString(),
              style: const TextStyle(color: AppColors.muted),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed:
                    controller.isLiked ? controller.unlike : controller.like,
                splashRadius: 1,
                icon: controller.isLiked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 1,
                icon: const Icon(Icons.chat_bubble_outline),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 1,
                icon: const Icon(Icons.airplane_ticket_outlined),
              ),
              IconButton(
                onPressed:
                    controller.isSaved ? controller.unsave : controller.save,
                splashRadius: 1,
                icon: Icon(
                  controller.isSaved
                      ? Icons.bookmark
                      : Icons.bookmark_outline_outlined,
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
