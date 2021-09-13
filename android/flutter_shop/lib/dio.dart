
import 'package:dio/dio.dart';

class DioHelper {
   static  Dio ?dio;
   static init() {
     dio = Dio(
         BaseOptions(
             baseUrl: "https://student.valuxapps.com/api/",
             receiveDataWhenStatusError: true,
             headers: {
               'Content-Type': 'application/json',
             }
         )
     );
   }
   static Future<Response>  getdate({
       required String? url,
       Map<String,dynamic>? quary,
       String ?lang = 'en' ,
       String? token,
   })
   async {

     dio!.options.headers={
       'lang':lang,
       'Authorization':token??'',
       'Content-Type': 'application/json',


     };
     return await dio!.get
       (
         url!,
         queryParameters: quary??null
     );
   }

   static Future<Response>  postdate( {
     required String? url,
     required Map<String, dynamic>? data,
     String ?lang = 'en',
     String? token,

   })
   async {

     dio!.options.headers={
       'lang':lang,
       'Authorization':token??'',
       'Content-Type': 'application/json',


     };
     return await dio!.post
       (
         url!,
         data: data
     );
   }
}



