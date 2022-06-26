import '../abstract_posts_vm.dart';
import '../posts_repository_interface.dart';
import '../strategies/from_top.dart';

class TopPostsViewModel extends PostsViewModel {
  TopPostsViewModel(IPostsRepository repository) : super(repository) {
    repository.setFetchPostsStrategy(FromTop());
  }
}
