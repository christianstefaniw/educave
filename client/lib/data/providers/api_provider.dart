import 'package:dio/dio.dart';

import 'api_provider_interface.dart';
import '../../core/config.dart';

class ApiProvider implements IApiProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseApiPath));

  @override
  Future get(String path) async {
    Response response = await _dio.get(path);
    return response.data;
  }

  @override
  Future post(String path, {data}) async {
    Response response = await _dio.post(path, data: data);
    return response.data;
  }
}
