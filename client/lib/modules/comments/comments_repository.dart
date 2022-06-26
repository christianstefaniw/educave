import '../../data/providers/api_provider.dart';
import '../../data/providers/api_provider_interface.dart';
import '../comment/comment_model.dart';
import '../comment/comment_repository.dart';
import 'comments_repository_interface.dart';

class CommentsRepository implements ICommentsRepository {
  final IApiProvider _client;
  final String _postId;

  CommentsRepository(this._client, this._postId);

  @override
  Future<void> addComment(CommentModel comment) async {}

  @override
  Future<List<CommentModel>> comments() async {
    const id = '1';
    return await Future.delayed(
        const Duration(seconds: 1),
        () => [
              CommentModel(
                CommentRepository(ApiProvider()),
                id: id,
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
                CommentRepository(ApiProvider()),
                id: id,
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
