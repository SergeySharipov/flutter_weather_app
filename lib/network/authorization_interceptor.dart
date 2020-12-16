import 'dart:async';

import 'package:chopper/chopper.dart';

class AuthorizationInterceptor implements RequestInterceptor {
  static const String appId = "34128a09a729099bd1fd39f2ac9cac1c";
  static const String units = "metric";
  final String lang;

  AuthorizationInterceptor(this.lang);

  @override
  FutureOr<Request> onRequest(Request request) async {
    request.parameters.addAll(
        {'lang': lang, 'appid': appId, 'units': units});
    return request;
  }
}
