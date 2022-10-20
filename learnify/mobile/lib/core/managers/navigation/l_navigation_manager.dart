abstract class INavigationManager {
  Future<void> navigateToPage({String path, Map<String, dynamic> data});
  Future<void> navigateToPageClear({String path, Map<String, dynamic> data});
}
