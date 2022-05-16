import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/helpers/date_time_format.dart';
import '../../core/theme/theme.dart';
import '../../data/providers/api_provider.dart';
import '../comments/comments_repository.dart';
import '../comments/comments_service.dart';
import '../comments/comments_vm.dart';
import '../comments/comments_widget.dart';
import 'features/feature_widget_factory.dart';
import 'features/post_feature.dart';
import 'post_vm.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(viewModel.profilePic),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewModel.username),
                    Text(
                      viewModel.postedIn,
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
                children: viewModel.features.map((PostFeature feature) {
              return FeatureWidgetFactory(feature);
            }).toList()),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              DateTimeFormat.monthDayYear.format(viewModel.dateTime).toString(),
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
                      onPressed:
                          viewModel.isLiked ? viewModel.unlike : viewModel.like,
                      splashRadius: 1,
                      iconSize: 23,
                      icon: viewModel.isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_outline),
                    ),
                    const SizedBox(width: 11),
                    SizedBox(
                      width: 27,
                      child: Text(
                        viewModel.likeCount.toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ChangeNotifierProvider(
                              create: (_) => CommentsViewModel(
                                CommentsService(
                                  CommentsRepository(
                                    ApiProvider(),
                                  ),
                                ),
                              ),
                              child: const Comments(),
                            );
                          },
                        );
                      },
                      iconSize: 23,
                      splashRadius: 1,
                      icon: const Icon(Icons.chat_bubble_outline),
                    ),
                    const SizedBox(width: 11),
                    SizedBox(
                      width: 27,
                      child: Text(
                        viewModel.commentCount.toString(),
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
                      viewModel.isSaved ? viewModel.unsave : viewModel.save,
                  splashRadius: 1,
                  iconSize: 25,
                  icon: Icon(
                    viewModel.isSaved
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
