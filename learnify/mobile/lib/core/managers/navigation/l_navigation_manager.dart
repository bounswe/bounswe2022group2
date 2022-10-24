abstract class INavigationManager {
  Future<void> navigateToPage(
      {required String path, Map<String, dynamic> data});
  Future<void> navigateToPageClear({String path, Map<String, dynamic> data});
  void pop();
}
