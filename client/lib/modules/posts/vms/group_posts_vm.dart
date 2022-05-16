import '../abstract_posts_vm.dart';
import '../posts_service_interface.dart';
import '../strategies/from_group.dart';

class GroupPostsViewModel extends PostsViewModel {
  GroupPostsViewModel(String groupId, IPostsService postsService)
      : super(postsService) {
    postsService.setFetchPostsStrategy(FromGroup(groupId));
  }
}
