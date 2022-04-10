import 'stories_repository.dart';
import 'stories_service_interface.dart';
import 'story_model.dart';

class StoriesService implements IStoriesService {
  final StoriesRepository _repository;

  StoriesService(this._repository);

  List<StoryModel>? _stories;

  @override
  List<StoryModel>? get stories => _stories;

  @override
  Future<void> loadStories() async {
    _stories = await _repository.stories();
  }
}
