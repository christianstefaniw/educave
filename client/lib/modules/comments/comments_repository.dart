import '../../data/providers/api_provider_interface.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';

class CommentsRepository implements ICommentsRepository {
  final IApiProvider _client;

  CommentsRepository(this._client);

  @override
  Future<List<CommentModel>> comments() async {
    return await Future.delayed(
        const Duration(seconds: 1),
        () => [
              CommentModel(
                id: '1',
                userId: '1',
                username: 'Christian Stefaniw',
                profilePic:
                    'https://avatars.githubusercontent.com/u/67922410?v=4',
                content: 'Great post!',
                likeCount: 2,
                timeSincePost: '2h',
                liked: false,
              ),
              CommentModel(
                id: '1',
                userId: '1',
                username: 'Christian Stefaniw',
                profilePic:
                    'https://avatars.githubusercontent.com/u/67922410?v=4',
                content: 'Great post wow super interesting etc whatever',
                likeCount: 2,
                timeSincePost: '3h',
                liked: false,
              ),
            ]);
  }
}
