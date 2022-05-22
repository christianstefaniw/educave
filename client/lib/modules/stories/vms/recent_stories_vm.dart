import '../stories_repository_interface.dart';
import '../abstract_stories_vm.dart';
import '../strategies/from_recent.dart';

class RecentStoriesViewModel extends StoriesViewModel {
  RecentStoriesViewModel(IStoriesRepository repository) : super(repository) {
    repository.setFetchStoriesStrategy(FromRecent());
  }
}
