import 'package:brainiaccommerce2/core/service/model/api_path_model.dart';

class APIServicePath {
  static const String baseUrl = "https://huflit.id.vn:4321/api";
  static String login() =>
      APIPathModel(serviceHost: baseUrl, endpoint: '/Auth/login').toStringPath;

  static String register() =>
      APIPathModel(serviceHost: baseUrl, endpoint: '/Student/signUp')
          .toStringPath;

  static String getInfoUser() =>
      APIPathModel(serviceHost: baseUrl, endpoint: '/Auth/current')
          .toStringPath;

  static String getCategories({required String accID}) => APIPathModel(
      serviceHost: baseUrl,
      endpoint: '/Category/getList',
      params: {"accountID": accID}).toStringPath;

  static String getProducts(
          {required String accID, required String categoryID}) =>
      APIPathModel(
          serviceHost: baseUrl,
          endpoint: '/Product/getListByCatId',
          params: {"accountID": accID, "categoryID": categoryID}).toStringPath;
}
