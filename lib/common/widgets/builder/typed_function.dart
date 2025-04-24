abstract class TypedFunction {
  void call([List<dynamic>? args]);
}

// after 3 args consider using object
class Fun0Args<R> extends TypedFunction {
  final R Function() fun;

  Fun0Args(this.fun);

  @override
  void call([List<dynamic>? args]) {
    if (args?.isNotEmpty == true) {
      throw ArgumentError('Function0Args takes no arguments');
    }

    fun();
  }
}

class Fun1Arg<R, P1> extends TypedFunction {
  final R Function(P1) fun;

  Fun1Arg(this.fun);

  @override
  void call([List<dynamic>? args]) {
    if (args?.length != 1) {
      throw ArgumentError('Function0Args takes no arguments');
    }

    fun(args?[0] as P1);
  }
}

class Fun2Args<R, P1, P2> extends TypedFunction {
  final R Function(P1, P2) fun;

  Fun2Args(this.fun);

  @override
  void call([List<dynamic>? args]) {
    if (args?.length != 2) {
      throw ArgumentError('Function0Args takes no arguments');
    }

    fun(args?[0] as P1, args?[1] as P2);
  }
}

class Fun3Args<R, P1, P2, P3> extends TypedFunction {
  final R Function(P1, P2, P3) fun;

  Fun3Args(this.fun);

  @override
  void call([List<dynamic>? args]) {
    if (args?.length != 3) {
      throw ArgumentError('Function0Args takes no arguments');
    }

    fun(args?[0] as P1, args?[1] as P2, args?[2] as P3);
  }
}
