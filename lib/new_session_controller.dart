import 'dart:math';
import 'package:get/get.dart';

class NewSessionController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt stressLevel = 0.obs;

  final Random random = new Random();
  NewSessionController() {
    calculateStressLevel();
  }

  calculateStressLevel() async {
    stressLevel.value = await Future.delayed(Duration(seconds: 3))
        .then((value) => random.nextInt(75 - 40) + 40);
    isLoading.value = false;
  }
}
