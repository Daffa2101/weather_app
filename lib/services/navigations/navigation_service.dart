part of '_navigations.dart';

class NavigationService implements Navigation {
  final _history = <String>[];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void updateHistory(String? routeName) {
    if (routeName != null) {
      _history.add(routeName);
    }
  }

  Future<T?> push<T>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<T?> pushReplacement<T, K>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushReplacement<T, K>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  @override
  Future<T?>? pushRoute<T>(Route<T> route, [String? routeName]) {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(route);
  }

  @override
  void pop<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  @override
  Future<T?> navigateTo<T>(Widget newPage, [String? routeName]) {
    return push<T>(newPage, routeName);
  }

  @override
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  @override
  void popToRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<T?> splashPush<T>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushReplacement(
      CustomPageRoute(widget),
    );
  }
}

class SplashPageRoute<T> extends MaterialPageRoute<T> {
  SplashPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Duration get transitionDuration => Duration.zero;
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
