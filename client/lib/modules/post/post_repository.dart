import '../../data/providers/api_provider_interface.dart';
import 'post_repository_interface.dart';

class PostRepository implements IPostRepository {
  final IApiProvider client;
  PostRepository({required this.client});

  @override
  Future<void> like(String id) async {}
}
