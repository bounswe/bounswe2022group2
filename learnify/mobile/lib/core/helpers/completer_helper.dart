import 'dart:async';

/// Collection of helpers for completers.
mixin CompleterHelper {
  /// Wraps the given future with a completer.
  static Completer<T> wrapCompleter<T>(Future<T> future) {
    final Completer<T> completer = Completer<T>();
    future.then(completer.complete).catchError(completer.completeError);
    return completer;
  }

  /// Wraps the given future with completers.
  static Completer<List<T>> wrapListCompleter<T>(List<Future<T>> futures) {
    final Completer<List<T>> completer = Completer<List<T>>();
    Future.wait(futures)
        .then(completer.complete)
        .catchError(completer.completeError);
    return completer;
  }

  /// Wraps the given future with a completer and a dependent completer.
  static Completer<T> wrapDependentCompleter<T>(
      Future<T> future, Future<T> Function(T val) dependent) {
    final Completer<T> completer = Completer<T>();
    future.then((T val) async {
      await dependent(val);
      completer.complete(val);
    }).catchError((_, __) {
      completer.completeError(<T>[]);
    });
    return completer;
  }
}
