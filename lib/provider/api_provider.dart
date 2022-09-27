import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  // Get request
  Future<Response> getData(String url) => get(url);
}
