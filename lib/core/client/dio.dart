part of '_client.dart';

final _options = Options(
  receiveTimeout: const Duration(seconds: 5000),
  sendTimeout: const Duration(seconds: 6000),
);

Future<Response<T>> getIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? queryParameters,
}) async {
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': headers,
    });
  }

  final resp = await di<Dio>().get<T>(
    url,
    options: _options,
    queryParameters: queryParameters,
  );

  if (kDebugMode) {
    LoggerService.i({
      'response': '${resp.data}',
      'statusCode': '${resp.statusCode}',
    });
  }

  return resp;
}

Future<Response<T>> postIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Map<String, dynamic>? queryParameters,
}) async {
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': headers,
      'model': '$model',
    });
  }
  final resp = await di<Dio>().post<T>(
    url,
    options: _options,
    data: json.encode(model),
    queryParameters: queryParameters,
  );
  if (kDebugMode) {
    LoggerService.i({
      'response': '${resp.data}',
      'statusCode': '${resp.statusCode}',
    });
  }
  return resp;
}
