import '../abstract_posts_vm.dart';
import '../posts_repository_interface.dart';
import '../strategies/from_recent.dart';

class RecentPostsViewModel extends PostsViewModel {
  RecentPostsViewModel(IPostsRepository repository) : super(repository) {
    repository.setFetchPostsStrategy(FromRecent());
  }
}
