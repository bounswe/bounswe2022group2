import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/view_states.dart';
import '../../helpers/completer_helper.dart';
import '../../managers/navigation/navigation_manager.dart';

/// Base view model class to create customized view models extending this.
abstract class BaseViewModel extends ChangeNotifier {
  /// Default constructor of [BaseViewModel].
  BaseViewModel() {
    _initCompleter = CompleterHelper.wrapCompleter<void>(_init());
  }

  ViewStates _viewState = ViewStates.uninitialized;

  /// Getter for [_viewState], shows the current state of the view.
  ViewStates get state => _viewState;

  /// Singleton navigation manager to use across the view models.
  final NavigationManager navigationManager = NavigationManager.instance;

  /// Custom init method to call before the initialization process is completed.
  FutureOr<void> initViewModel();

  /// Custom dispose method to call before the dispose.
  FutureOr<void> disposeViewModel() {}

  /// Init state of the view.
  void initView() {}

  /// Deactivation callback of the view.
  void deactivateView() {}

  late Completer<void> _initCompleter = Completer<void>();

  /// Completer to use for un awaited async function.
  late Completer<void> completer;

  /// Returns the init completer.
  Completer<void> get initCompleter => _initCompleter;

  /// Cancelable operation for auth operations.
  CancelableOperation<String?>? operation;

  Future<void> _init() async {
    completer = Completer<void>();
    await initViewModel();
    if (_viewState == ViewStates.disposed) return;
    _viewState = ViewStates.loaded;
    reloadState();
  }

  @mustCallSuper

  /// Dispose of the view.
  void disposeView() {
    _viewState = ViewStates.disposed;
  }

  /// Custom dispose method of the view model.
  Future<void> customDispose() async {
    await _disposeOperation();
  }

  Future<void> _disposeOperation() async {
    if (!completer.isCompleted) await completer.future;
    await operation?.cancel();
  }

  /// Reloads the state.
  void reloadState() {
    if (_viewState != ViewStates.loading && _viewState != ViewStates.disposed) {
      notifyListeners();
    }
  }

  /// Switches the loading status between
  /// [ViewStates.loaded] and [ViewStates.loading].
  void toggleLoadingStatus() {
    switch (_viewState) {
      case ViewStates.loading:
        _viewState = ViewStates.loaded;
        break;
      case ViewStates.loaded:
        _viewState = ViewStates.loading;
        break;
      default:
        return;
    }
    reloadState();
  }

  /// Returns whether the state is initialized.
  bool get isInitialized => state != ViewStates.uninitialized;
}
