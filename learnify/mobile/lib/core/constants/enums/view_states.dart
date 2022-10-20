/// Enum to determine view states in view models.
enum ViewStates {
  /// Indicates that the view is not initialized yet.
  uninitialized,

  /// Indicates that the view is in the loading status.
  loading,

  /// Indicates that the view is loaded and ready to display.
  loaded,

  /// Indicates that the view is disposed.
  disposed,
}
