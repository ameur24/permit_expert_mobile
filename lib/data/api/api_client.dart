import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test2/routes/routes_helper.dart';

import '../../contants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = Constants.baseUrl;
    timeout = const Duration(seconds: 30);
    token = GetStorage().read('TOKEN') ?? "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response =
      await get(uri, headers: headers ?? _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> getDataWithParms(String uri,
      {Map<String, String>? headers,
        required Map<String, String> query}) async {
    try {
      Response response =
      await get(uri, headers: headers ?? _mainHeaders, query: query)
          .then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> getDataWithParams(String uri,
      {Map<String, String>? headers,
        required Map<String, dynamic> queryParameters}) async {
    try {
      Response response = await get(uri,
          headers: headers ?? _mainHeaders, query: queryParameters)
          .then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response =
      await post(uri, body, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, dynamic body) async {
    try {
      Response response = await put(uri, body, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri, dynamic body) async {
    try {
      Response response =
      await delete(uri, headers: _mainHeaders).then((value) {
        notAuthenticated(value, uri);
        return value;
      });
      return response;
    } catch (e,stack) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  void notAuthenticated(Response<dynamic> res, String uri) {
 if (res.statusCode == 401) {
       print("User is not authenticated.");
     //TODO : test if user is not authorized
   Get.offAllNamed(RouteHelper.getSignInPage());
      }
       else if (res.statusCode != 200 && res.statusCode != 201) {

        print("Server error: ${res.statusCode}");
        //TODO : test if there's any other type of exception
      }
    }

  }











