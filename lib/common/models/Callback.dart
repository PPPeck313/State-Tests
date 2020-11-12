class Callback {

  //============================================================================
  // Instance Fields
  //============================================================================

  Function _function;
  List<dynamic> _args;

  //============================================================================
  // Constructors
  //============================================================================

  Callback(this._function);

  Callback.args(this._function, this._args);

  Callback.arg(Function function, dynamic arg) {
    this._function = function;
    _args = List<dynamic>();
    _args.add(arg);
  }

  Callback.copy(Callback callback) {
    this._function = callback._function;
    this._args = callback._args;
  }

  //============================================================================
  // Instance Methods
  //============================================================================

  dynamic run() {
    return Function.apply(_function, _args);
  }

  dynamic runArg(dynamic arg) {
    List<dynamic> args = List<dynamic>();
    args.add(arg);

    return Function.apply(_function, args);
  }

  dynamic runArgs(List<dynamic> args) {
    return Function.apply(_function, args);
  }



  Callback addArg(dynamic arg) {
    if (_args == null) {
      _args = List<dynamic>();
    }

    _args.add(arg);
    return this;
  }

  Callback addArgs(List<dynamic> args) {
    if (this._args == null) {
      this._args = List<dynamic>();
    }

    this._args.addAll(args);
    return this;
  }



  Callback setArgs(List<dynamic> args) {
    this._args = args;
    return this;
  }
}