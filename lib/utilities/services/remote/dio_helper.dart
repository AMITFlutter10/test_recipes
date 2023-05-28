import 'package:dio/dio.dart';
import 'package:test_recipes_app/model/services/local_storage/shared_preferences.dart';
import 'package:test_recipes_app/utilities/enums.dart';
import 'end_points.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        //Here we Put The Headers Needed in The API.
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (_) => true,
      ),
    );
  }


  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    token = MyCache.getString(key: MySharedKeys.keyToken);
    print(token);
    try {
      dio.options.headers =
      {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e) {
      rethrow;
    }
  }
}