import "package:http/http.dart" as http;
import 'dart:convert';

 final String ?urlServer = "https://ext-book.herokuapp.com";
 final String url = "/books/api/atlas/codetabletree/subcodes";
 Map<String, String> filters = {'M': '1', 'C': '0', 'parent':'00010000020'};
 Map<String, String> ?header = {
"Content-type": "application/json",
"Accept": "application/json",
};

 late var uri = Uri.parse(urlServer!,);
 Future getData()async {
  var response = await http.get(uri, headers: header );
  if(response.statusCode==200){
   String bodyutf8 = utf8.decode(response.bodyBytes);
   var rtnList = jsonDecode(bodyutf8);
   List data = rtnList as List ;
   var nums = data.length;
   return data;
 }
}