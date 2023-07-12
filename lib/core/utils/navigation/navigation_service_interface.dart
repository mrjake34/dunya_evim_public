abstract class NavigationServiceInterface {
  Future<void> navigateToPage({required String path, Object? data});
  Future<void> navigateToPageAndRemoveUntil({required String path, Object? data});
  void navigateToBack();
}
