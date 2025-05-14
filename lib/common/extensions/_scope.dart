extension ScopeExtension<T> on T {
  R let<R>(R Function(T) block) => block(this);

  T also(void Function(T) block) {
    block(this);
    return this;
  }
}

extension NullableScopeExtension<T> on T? {
  R? letOrNull<R>(R Function(T) block) => this != null ? block(this!) : null;
}
