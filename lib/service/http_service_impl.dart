import 'package:dio/dio.dart';
import 'package:news_api_getx/service/http_service.dart';

const BASE_URL = "https://newsapi.org";
const API_KEY = "&apiKey=cb03086330f5421586ec892ecef42267";

class HttpServiceImpl implements HttpService {
  var _dio = Dio();

  @override
  Future<Response?> getRequest(String url) async {
    Response? response;
    String _url = BASE_URL + url + API_KEY;
    //print(_url);

    try {
      response = await Dio().get(_url);
      print(_url);
      print(response);
      if (response.statusCode == 200) return response;
    } catch (e) {
      print(e);
    }

    print("response_done");
  }

  initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      print(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      print("${request.method} | ${request.path}");
    }, onResponse: (response, responseInterceptorHandler) {
      print(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
    }));
  }

  @override
  void init() {
    initializeInterceptors();
  }
}
