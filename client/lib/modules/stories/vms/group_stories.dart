import '../abstract_stories_vm.dart';
import '../stories_repository_interface.dart';
import '../strategies/from_group.dart';

class GroupStoriesViewModel extends StoriesViewModel {
  GroupStoriesViewModel(String groupId, IStoriesRepository repository)
      : super(repository) {
    repository.setFetchStoriesStrategy(FromGroup(groupId));
  }
}
