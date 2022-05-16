abstract class ICommentRepository {
  Future<void> delete();
  Future<void> like();
  Future<void> unlike();
}
