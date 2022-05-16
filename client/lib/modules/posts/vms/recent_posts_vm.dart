import '../abstract_posts_vm.dart';
import '../posts_service_interface.dart';
import '../strategies/from_recent.dart';

class RecentPostsViewModel extends PostsViewModel {
  RecentPostsViewModel(IPostsService _postsService) : super(_postsService) {
    _postsService.setFetchPostsStrategy(FromRecent());
  }
}
