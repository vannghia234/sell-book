// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brainiaccommerce2/core/service/client/local_service_client.dart';
import 'package:get/get.dart';

class LoginAccountInfoController extends GetxController {
  @override
  void onInit() {
    getAccessToken();
    super.onInit();
  }

  // lưu trữ thông tin account
  var _accessToken = "";
  var _refreshToken = "";

  get accessToken => _accessToken;

  set accessToken(final value) => _accessToken = value;

  get refreshToken => _refreshToken;

  set refreshToken(value) => _refreshToken = value;

  Future<void> saveAccessToken() async {
    await LocalServiceClient.save(key: 'accessToken', value: accessToken);
    await LocalServiceClient.save(key: 'refreshToken', value: refreshToken);
  }

  Future removeToken(String key) async {
    await LocalServiceClient.remove(key);
  }

  Future getAccessToken() async {
    if (LocalServiceClient.get("accessToken") != null &&
        LocalServiceClient.get("refreshToken") != null) {
      accessToken = await LocalServiceClient.get("accessToken");
      refreshToken = await LocalServiceClient.get("refreshToken");
    }
  }
}
