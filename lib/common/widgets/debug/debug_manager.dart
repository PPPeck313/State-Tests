class DebugManager {
  bool _isDebugEnabled = false;
  bool get isDebugEnabled => _isDebugEnabled;

  static final DebugManager _instance = DebugManager._internal();

  factory DebugManager() => _instance;

  DebugManager._internal();

  void flipState() {
    _isDebugEnabled = !_isDebugEnabled;
  }
}
