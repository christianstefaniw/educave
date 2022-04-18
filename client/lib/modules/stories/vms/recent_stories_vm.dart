import '../stories_service_interface.dart';
import '../abstract_stories_vm.dart';
import '../strategies/from_recent.dart';

class RecentStoriesViewModel extends StoriesViewModel {
  RecentStoriesViewModel(IStoriesService service) : super(service) {
    this.service.setFetchStoriesStrategy(FromRecent());
  }
}
