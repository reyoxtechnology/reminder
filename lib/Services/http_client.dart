import 'dart:convert';
import 'package:http/http.dart';

class HttpClient{
  Future <Response> postMethod(Map<String, String>? headers,Map<String, dynamic>? body, Uri url) async {
    final response = await post(url,headers: headers, body: jsonEncode(body));
    return response;
  }
  Future<Response> getMethod(Map<String, String>? headers, Uri url) async {
    final response = await get(url, headers: headers,);
    return response;
  }
  Future <Response> putMethod(Map<String, String>? headers,Map<String, dynamic>? body, Uri url) async {
    final response = await put(url,headers: headers, body: jsonEncode(body));
    return response;
  }
  Future <Response> deleteMethod(Map<String, String>? headers, Uri url) async {
    final response = await delete(url,headers: headers);
    return response;
  }
}