import '../../data/providers/api_provider_interface.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';

class CommentsRepository implements ICommentsRepository {
  final IApiProvider _client;

  CommentsRepository(this._client);

  @override
  Future<void> addComment(CommentModel comment) async {}

  @override
  Future<List<CommentModel>> comments() async {
    return await Future.delayed(
        const Duration(seconds: 1),
        () => [
              CommentModel(
                id: '1',
                userId: '1',
                username: 'Bob Smith',
                profilePic:
                    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                content: 'Great post!',
                likeCount: 2,
                timeSincePost: '2h',
                liked: false,
              ),
              CommentModel(
                id: '1',
                userId: '1',
                username: 'Bob Smith',
                profilePic:
                    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                content: 'Great post wow super interesting etc whatever',
                likeCount: 2,
                timeSincePost: '3h',
                liked: false,
              ),
            ]);
  }
}
