import '../abstract_posts_vm.dart';
import '../posts_service_interface.dart';
import '../strategies/top.dart';

class TopPostsViewModel extends PostsViewModel {
  TopPostsViewModel(IPostsService _service) : super(_service) {
    _service.setFetchPostsStrategy(FromTop());
  }
}
