part of '_navigations.dart';

abstract class Navigation {
  Future<T?> navigateTo<T>(Widget newPage, [String routeName]);
  Future<T?>? pushRoute<T>(ModalRoute<T> route, [String routeName]);
  void pop<T>([T result]);
  void popUntil(String routeName);
  void popToRoot();
  void updateHistory(String routeName);
}
