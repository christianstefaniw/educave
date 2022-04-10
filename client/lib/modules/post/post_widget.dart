import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/date_time_format.dart';
import '../../core/theme/theme.dart';
import 'features/feature_widget_factory.dart';
import 'features/post_feature.dart';
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

    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(controller.profilePic),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.username),
                    Text(
                      controller.postedIn,
                      style: const TextStyle(color: AppColors.muted),
                    )
                  ],
                ),
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
                children: controller.features.map((PostFeature feature) {
              return FeatureWidgetFactory(feature);
            }).toList()),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateTimeFormat.monthDayYear
                  .format(controller.dateTime)
                  .toString(),
              style: const TextStyle(color: AppColors.muted),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: controller.isLiked
                          ? controller.unlike
                          : controller.like,
                      splashRadius: 1,
                      iconSize: 23,
                      icon: controller.isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_outline),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 11),
                      child: Text(
                        controller.likeCount.toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 23,
                      splashRadius: 1,
                      icon: const Icon(Icons.chat_bubble_outline),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 11),
                      child: Text(
                        controller.commentCount.toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      splashRadius: 1,
                      iconSize: 25,
                      icon: const Icon(Icons.airplane_ticket_outlined),
                    ),
                  ],
                ),
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed:
                      controller.isSaved ? controller.unsave : controller.save,
                  splashRadius: 1,
                  iconSize: 25,
                  icon: Icon(
                    controller.isSaved
                        ? Icons.bookmark
                        : Icons.bookmark_outline_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
