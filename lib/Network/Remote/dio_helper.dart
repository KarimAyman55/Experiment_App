import 'package:dio/dio.dart';
class DioHelper {

  static Dio? dio ;

  static initDio (){
    dio?.interceptors
        .add(InterceptorsWrapper(onRequest : (options, handler) async {
      print(options.uri);
      return handler.next(options);
    }));

     dio =  Dio(
   BaseOptions(
     baseUrl: 'https://newsapi.org/',
     receiveDataWhenStatusError: true
   ,
   ),
     );

  }
  static Future < Response?> getData ({
    required url,
    required Map <String , dynamic > query,
  })async{
    return await dio!.get (url,queryParameters:query,

    );}

  }
