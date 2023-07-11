import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/persistence.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:flutter_getx_template/data/respository/repository_impl.dart';
import 'package:flutter_getx_template/data/storage.dart';
import 'package:get/get.dart';

class GlobalBindings extends BindingsInterface {
  @override
  void dependencies() async {
    Get.put<NetworkCore>(NetworkCore(), permanent: true);
    Get.put<StorageCore>(StorageCore(), permanent: true);
    Get.put<PersistenceCore>(PersistenceCore(), permanent: true);
    Get.put<Repository>(
        RepositoryImpl(
            networkCore: Get.find<NetworkCore>(),
            persistenceCore: Get.find<PersistenceCore>()),
        permanent: true);
  }
}