import 'package:flutter/foundation.dart';

import 'package:get_storage/get_storage.dart';

class StorageCore {

  late GetStorage storage;

  StorageCore() {
    GetStorage.init();
    storage = GetStorage();
  }

  // Future<LoginModel?> getLoginState() async {
  //   try {
  //     Map<String, dynamic> data = await storage.read('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     debugPrint('Already login');
  //     return auth;
  //   } catch (e) {
  //     debugPrint('error get login state: $e');
  //     return null;
  //   }
  // }
  //
  // Future saveAuthResponse(LoginModel? loginModel) async {
  //   try {
  //     await storage.write('auth_result', loginModel?.toJson());
  //     debugPrint("Saved Auth Response !");
  //   } catch (e) {
  //     debugPrint('error save login state: $e');
  //   }
  // }

  Future deleteAuthResponse() async {
    try {
      await storage.remove('auth_result');
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  bool? isFirstOpen() {
    return storage.read('first_open');
  }

  // String? getAccessToken() {
  //   try {
  //     Map<String, dynamic> data = storage.read('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     return auth.data?.token;
  //   } catch (e) {
  //     debugPrint("Error while load access token: $e");
  //     return null;
  //   }
  // }
  //
  // String? getCurrentUserId() {
  //   try {
  //     Map<String, dynamic> data = storage.read('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     return auth.data?.user?.id.toString();
  //   } catch (e) {
  //     debugPrint("Error while load user_id: $e");
  //     return null;
  //   }
  // }

  dynamic getObject(String key) {
    try {
      dynamic data = storage.read(key);
      return data;
    } catch (e) {
      debugPrint("Error while load access token: $e");
      rethrow;
    }
  }

  Future saveObject(dynamic object, String key) async {
    try {
      await storage.write(key, object);
    } catch (e) {
      debugPrint('error save$key : $e');
      rethrow;
    }
  }

  Future removeObject(String key) async {
    try {
      await storage.remove(key);
    } catch (e) {
      debugPrint('error removing$key : $e');
      rethrow;
    }
  }
}