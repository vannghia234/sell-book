import 'package:brainiaccommerce2/core/service/model/api_path_model.dart';

class APIServicePath {
  static const String baseUrl = "https://huflit.id.vn:4321/api";
  static String login({required String username, required String password}) =>
      APIPathModel(serviceHost: baseUrl, endpoint: '/Auth/login').toString();

  static String register(
          {required String username, required String password}) =>
      APIPathModel(serviceHost: baseUrl, endpoint: '/Student/signUp')
          .toString();
}
