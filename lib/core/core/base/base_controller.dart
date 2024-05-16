import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:flutter_getx_template/data/storage.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final network = Get.find<NetworkCore>();
  final storage = Get.find<StorageCore>();
  final repository = Get.find<Repository>();
}
