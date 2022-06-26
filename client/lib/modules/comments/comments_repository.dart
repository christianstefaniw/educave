import '../../core/value_objects/text.dart';
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
              CommentModel.create(
                CommentRepository(ApiProvider()),
                content: Text('Great post wow super interesting etc whatever'),
                userId: '1',
                profilePic:
                    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                username: 'Bob Smith',
              ),
              CommentModel.create(
                CommentRepository(ApiProvider()),
                content: Text('Great post wow super interesting etc whatever'),
                userId: '1',
                profilePic:
                    'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                username: 'Bob Smith',
              ),
            ]);
  }
}
