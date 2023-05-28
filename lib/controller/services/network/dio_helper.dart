
//Dio Helper That's Connect and Talk to API.
import 'package:dio/dio.dart';
import 'package:epf_app/controllers/data/data_provider/local/cache_helper.dart';
import 'package:epf_app/utilities/enums.dart';

import 'end_points.dart';

class DioHelper
{
  static Dio dio= Dio();

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init()
  {
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
        validateStatus: (_)=>true,
      ),
    );
  }

  // _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   return '?token=$token';
  // }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token ,
  }) async {
    token =MyCache.getString(key: MySharedKeys.keyToken);
    print(token);
    try
    {
      dio.options.headers =
      {
        'Authorization'  : 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        url,
        queryParameters  : queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on
  // URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    dynamic data,
    // String? token,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // String token= "${MyCache.getString(key: MySharedKeys.keyToken)}";
    try
    {
      // dio.options.headers = {
      //   'Authorization': 'Bearer ${token ?? ''}',
      // };
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters  : queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }

  }
  static Future<Response> postedData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String token= "${MyCache.getString(key: MySharedKeys.keyToken)}";
    try
    {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters  : queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }

  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try
    {
      dio.options.headers =
      {
        'Authorization' : 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.put(
        url,
        data: data,
        onSendProgress   : onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }

  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url   ,
    required Map<String   ,
        dynamic> data     ,
    required String token ,
    bool files = false    ,
  }) async {
    dio.options.headers =
    {
      'Authorization'   : 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type'    : 'application/json',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try
    {
      dio.options.headers =
      {
        'Authorization'   : 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type'  : 'application/json',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    }

    catch (e) {
      rethrow;
    }

  }
}








// import 'package:dio/dio.dart';
// import 'package:epf_app/controllers/data/data_provider/local/cache_helper.dart';
// import 'package:epf_app/utilities/enums.dart';
// import 'end_points.dart';
//
//
// //Dio Helper That's Connect and Talk to API.
// class DioHelper
// {
//   static Dio dio= Dio();
//
//   //Here The Initialize of Dio and Start Connect to API Using baseUrl.
//   static init()
//   {
//     dio = Dio(
//       BaseOptions(
//         //Here the URL of API.
//         baseUrl: baseUrl,
//        receiveDataWhenStatusError: true,
//         //Here we Put The Headers Needed in The API.
//         headers:
//         {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         validateStatus: (_)=>true,
//       ),
//     );
//   }
//
//   // _getToken() async {
//   //   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   //   var token = localStorage.getString('token');
//   //   return '?token=$token';
//   // }
//
//   //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? queryParameters,
//     ProgressCallback? onReceiveProgress,
//     String? token ,
//   }) async {
//     token =MyCache.getString(key: MySharedKeys.keyToken);
//     print(token);
//     try
//     {
//       dio.options.headers =
//       {
//         'Authorization'  : 'Bearer ${token ?? ''}',
//       };
//       final Response response = await dio.get(
//         url,
//         queryParameters  : queryParameters,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     }
//
//     catch (e)
//     {
//       rethrow;
//     }
//   }
//
//   //This Function that's Used To Post Data to API based on
//   // URL(End Points) and Headers.
//   static Future<Response> postData({
//     required String url,
//     required Map<String, dynamic> data,
//     Map<String, dynamic>? queryParameters,
//     String? token,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     print(token);
//     try
//     {
//       final Response response = await dio.post(
//         url,
//         data: data,
//         queryParameters  : queryParameters,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     }
//
//     catch (e)
//     {
//       rethrow;
//     }
//
//   }
//
//   //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
//   static Future<Response> putData({
//     required String url,
//     required Map<String, dynamic> data,
//     String? token,
//     //bool files = false,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try
//     {
//       dio.options.headers =
//       {
//         'Authorization' : 'Bearer ${token ?? ''}',
//       };
//       final Response response = await dio.put(
//         url,
//         data: data,
//         onSendProgress   : onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     }
//
//     catch (e)
//     {
//       rethrow;
//     }
//
//   }
//
//   //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
//   static Future<Response> patchData({
//     required String url   ,
//     required Map<String   ,
//         dynamic> data     ,
//     required String token ,
//     bool files = false    ,
//   }) async {
//     dio.options.headers =
//     {
//       'Authorization'   : 'Bearer $token',
//       // 'Authorization': token ,
//       'Content-Type'    : 'application/json',
//     };
//     return await dio.patch(
//       url,
//       data: data,
//     );
//   }
//
//   //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
//   static Future<Response> deleteData({
//     required String url,
//     Map<String, dynamic>? data,
//     String? token,
//     //String lang = 'en',
//   }) async {
//     try
//     {
//       dio.options.headers =
//       {
//         'Authorization'   : 'Bearer $token',
//         // 'Authorization': token ,
//         //'Content-Type'  : 'application/json',
//       };
//       final Response response = await dio.delete(
//         url,
//         data: data,
//       );
//       return response;
//     }
//
//     catch (e) {
//       rethrow;
//     }
//
//   }
// }
//
// //
// // import 'dart:convert';
// //
// // import 'package:epf_app/controllers/data/data_provider/local/cache_helper.dart';
// // import 'package:epf_app/utilities/enums.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart'as http;
// // import 'package:http/http.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'end_points.dart';
// //
// // class HelperApi {
// //   static Future<Response> postData({
// //   required String url,
// //     required Map<String, dynamic> data,
// //     String? token,
// //     // required BuildContext context ,
// //      }) async{
// //     var jsonResponse ;
// //     String body = json.encode(data);
// //     var response = await http.post(
// //       Uri.parse(url),
// //       body: body,
// //       headers: {
// //         "Content-Type": "application/json",
// //         "Accept": "application/json",
// //         'Authorization': 'Bearer $token',
// //       },
// //     );
// //     print(response.body);
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       jsonResponse = json.decode(response.body.toString());
// //       // ScaffoldMessenger.of(context)
// //       //     .showSnackBar(SnackBar(
// //       //     content:Text(" ${jsonResponse['message']}")
// //      // )
// //     //) ;
// //
// //       //Or put here your next screen using Navigator.push() method
// //       print('success');
// //     } else {
// //       print('error');
// //     }
// //     return response;
// //   }
// //   // static Future<Response> postData({
// //   //   required String url,
// //   //   required Map<String, dynamic> data,
// //   //   String? token,
// //   //   context
// //   // }) async {
// //   //   final  Response response = await http.post(
// //   //       Uri.parse(baseUrl),
// //   //       body: data,
// //   //       headers: {
// //   //         // "Content-Type": "application/json",
// //   //         "Accept": "application/json",
// //   //         'Authorization': 'Bearer $token',
// //   //       },
// //   //     );
// //   //     // print(response.body);
// //   //     print(response.statusCode);
// //   //     var jsonResponse;
// //   //     if (response.statusCode == 200) {
// //   //       jsonResponse = json.decode(response.body.toString());
// //   //       ScaffoldMessenger.of(context)
// //   //           .showSnackBar(
// //   //           SnackBar(content: Text(" ${jsonResponse['message']}")));
// //   //
// //   //       //Or put here your next screen using Navigator.push()
// //   //       // method
// //   //       print('success');
// //   //
// //   //     }
// //   //     else {
// //   //       print('error');
// //   //     }
// //   //   return response;
// //   //   }
// //     //   final Response response = await  http.post(
// //     //     Uri.parse(baseUrl),
// //     //     body: data,
// //     //     headers: {
// //     //       "Accept":"application/json",
// //     //       // "Content-Type": "application/json",
// //     //       'Authorization': 'Bearer $token',
// //     //     },);
// //     //   if(response.statusCode ==200){
// //     //     var dataa= jsonDecode(response.body.toString());
// //     //     print(data['token']);
// //     //     print('http package Response body ${response.body} '
// //     //         'statusCode ${response.statusCode}');
// //     //   }else{
// //     //     print("failed");
// //     //   }
// //     //
// //     //   return response;
// //     // }
// //     //
// //     // catch (e)
// //     // {
// //     //   rethrow;
// //     // }
// //
// //   static Future<Response> getData({
// //     required String url,
// //     Map<String, dynamic>? data,
// //     String? token,
// //   }) async {
// //     try
// //     {
// //       var x=url+ await _getToken();
// //       MyCache.getString(key: MySharedKeys.keyToken);
// //       final Response response = await  http.get(
// //         Uri.parse(x),
// //         headers: {
// //           "Accept":"application/json",
// //           "Content-Type": "application/json",
// //           'Authorization': 'Bearer $token',
// //         },);
// //       data = jsonDecode(response.body.toString());
// //       print(data!);
// //       print (data["message"]);
// //       return response;
// //     }
// //
// //     catch (e)
// //     {
// //       rethrow;
// //     }
// //
// //   }
// //
// //
// // }
// // _getToken() async {
// //   SharedPreferences localStorage = await SharedPreferences.getInstance();
// //   var token = localStorage.getString('token');
// //   return '?token=$token';
// // }