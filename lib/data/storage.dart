import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class StorageCore {
  final storage = LocalStorage('local_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }


  // Future<LoginModel?> getLoginState() async {
  //   try {
  //     bool isStorageReady = await storage.ready;
  //     debugPrint('storage ready? $isStorageReady');
  //     if (isStorageReady) {
  //       Map<String, dynamic> data = storage.getItem('auth_result');
  //       /// TODO - Replace with login model after login
  //       // LoginModel auth = LoginModel.fromJson(data);
  //       // debugPrint('Already login');
  //       // return auth;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint('error get login state: $e');
  //     return null;
  //   }
  // }

  // Future saveAuthResponse(LoginModel? loginModel) async {
  //   try {
  //     bool isStorageReady = await storage.ready;
  //     if (isStorageReady) {
  //       await storage.setItem('auth_result', loginModel?.toJson());
  //     }
  //   } catch (e) {
  //     debugPrint('error save login state: $e');
  //   }
  // }

  Future deleteAuthResponse() async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem('auth_result');
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  bool? isFirstOpen() {
    return storage.getItem('first_open');
  }

  // String? getAccessToken() {
  //   try {
  //     Map<String, dynamic> data = storage.getItem('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     return auth.token?.token;
  //   } catch (e) {
  //     debugPrint("Error while load access token: $e");
  //     return null;
  //   }
  // }

  // String? getCurrentUserId() {
  //   try {
  //     Map<String, dynamic> data = storage.getItem('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     return auth.employees?.idUserFinger.toString();
  //   } catch (e) {
  //     debugPrint("Error while load user_id: $e");
  //     return null;
  //   }
  // }

  // String? getCurrentUserPD() {
  //   try {
  //     Map<String, dynamic> data = storage.getItem('auth_result');
  //     LoginModel auth = LoginModel.fromJson(data);
  //     return auth.employees?.pd.toString();
  //   } catch (e) {
  //     debugPrint("Error while load user_id: $e");
  //     return null;
  //   }
  // }

  dynamic getObject(String key) {
    try {
      dynamic data = storage.getItem(key);
      return data;
    } catch (e) {
      debugPrint("Error while load access token: $e");
      rethrow;
    }
  }

  Future saveObject(dynamic object, String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem(key, object);
      }
    } catch (e) {
      debugPrint('error save$key : $e');
      rethrow;
    }
  }

  Future removeObject(String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem(key);
      }
    } catch (e) {
      debugPrint('error removing$key : $e');
      rethrow;
    }
  }
}
