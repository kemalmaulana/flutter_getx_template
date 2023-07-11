import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class PersistenceCore {
  final storage = LocalStorage('persistence_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }

  Future getPersisteModel(String key) async {
    try {
      bool isStorageReady = await storage.ready;
      debugPrint('storage ready? $isStorageReady');
      if (isStorageReady) {
        dynamic data = storage.getItem(key);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('error get login state: $e');
      return null;
    }
  }

  Future setPersistModel(String key, dynamic model) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem(key, model);
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }
}
