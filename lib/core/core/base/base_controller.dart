import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/persistence.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:flutter_getx_template/data/storage.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final network = Get.find<NetworkCore>();
  final storage = Get.find<StorageCore>();
  final persistence = Get.find<PersistenceCore>();
  final repository = Get.find<Repository>();

  Future<bool> checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      Fimber.d('Connected to a Wi-Fi network');
      return true;
    } else if (result == ConnectivityResult.mobile) {
      Fimber.d('Connected to a mobile network');
      return true;
    } else {
      Fimber.d('Not connected to any network');
      return false;
    }
  }
}
