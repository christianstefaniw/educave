abstract class IGroupRepository {
  Future<void> join();
  Future<void> unjoin();
  Future<void> delete();
}
