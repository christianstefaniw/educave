import '../../core/types/view_model.dart';
import 'stories_repository_interface.dart';
import 'story_model.dart';

abstract class StoriesViewModel with ViewModel {
  final IStoriesRepository _repository;

  List<StoryModel>? _stories;
  bool _mounted = true;

  StoriesViewModel(this._repository) {
    _loadStories();
  }

  List<StoryModel>? get stories => _stories;
  bool get storiesLoaded => _stories != null;

  Future<void> _loadStories() async {
    _stories = await _repository.stories();
    if (_mounted) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _mounted = false;
  }
}
