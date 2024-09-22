import 'package:flutter/material.dart';
import 'package:flutter_getx_template/feature/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Obx(() => Visibility(
          visible: controller.userModel.value.isNotEmpty,
          replacement: const Center(child: CircularProgressIndicator.adaptive(),),
          child: ListView.builder(
                itemCount: controller.userModel.value.length,
                itemBuilder: (_, index) {
                  var item = controller.userModel.value[index];
                  return ListTile(
                    title: Text(item.email ?? 'test'),
                  );
                },
              ),
        )),
      ),
    );
  }
}
