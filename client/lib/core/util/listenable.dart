class Listenable<T> {
  late T _state;
  final List<Function> _listeners = [];

  Listenable(T initialState) : _state = initialState;

  void addListener(Function f) {
    _listeners.add(f);
  }

  void removeListener(Function f) {
    _listeners.remove(f);
    print(_listeners);
  }

  void notifyListeners() {
    for (Function listener in _listeners) {
      listener();
    }
  }

  void setState(T newState) {
    _state = newState;
    notifyListeners();
  }

  T getState() {
    return _state;
  }

  @override
  String toString() {
    return _state.toString();
  }
}
