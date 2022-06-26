class CustomException implements Exception {
  final String _cause;
  CustomException(this._cause);

  @override
  String toString() => _cause;
}
