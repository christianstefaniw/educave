import '../stories_service_interface.dart';
import '../abstract_stories_vm.dart';
import '../strategies/from_group.dart';

class GroupStoriesViewModel extends StoriesViewModel {
  GroupStoriesViewModel(String groupId, IStoriesService service)
      : super(service) {
    this.service.setFetchStoriesStrategy(FromGroup(groupId));
  }
}
