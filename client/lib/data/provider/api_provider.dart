import 'package:dio/dio.dart';

import '../../core/constants/api/api_routes.dart';
import 'api_provider_interface.dart';

class ApiProvider implements IApiProvider {
  final Dio dio = Dio(BaseOptions(baseUrl: baseApiPath));

  @override
  Future get(String path) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String path, {data}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
