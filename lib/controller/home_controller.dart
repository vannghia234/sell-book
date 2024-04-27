import 'package:brainiaccommerce2/core/service/client/api_service_client.dart';
import 'package:brainiaccommerce2/core/service/locator/api_service_path.dart';
import 'package:brainiaccommerce2/model/category_model.dart';
import 'package:brainiaccommerce2/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    loadUserInfo();
    super.onInit();
  }


  Rx<UserModel> user = UserModel().obs;

  Future loadUserInfo() async {
    var value = await ApiServiceClient.get(
      uri: APIServicePath.getInfoUser(),
    );
    UserModel model = UserModel.fromJson(value);
    user.value = model;
    print("Loaded UserModel ${user.toJson()}");
  }

  Future<CategoryModel> getCategories() async {
    print("user ${user.value.accountId}");
    var value = await ApiServiceClient.getDynamic(
      uri: APIServicePath.getCategories(accID: user.value.accountId!),
    );
    CategoryModel model = CategoryModel.fromJson(value);
    print("getCategories ${model.toJson()}");

    return model;
  }

  Future<dynamic> getListByCatID(String catID) async {
    print("user ${user.value.accountId}");
    var value = await ApiServiceClient.getDynamic(
      uri: APIServicePath.getProducts(
          accID: user.value.accountId!, categoryID: catID),
    );
    // CategoryModel model = CategoryModel.fromJson(value);
    print("getCategories ${value}");
  }
}
