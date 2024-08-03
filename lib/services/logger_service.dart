import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  /// Log a message at level [Level.trace].
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().t(message, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) Logger().f(message, error: error, stackTrace: stackTrace);
  }
}
