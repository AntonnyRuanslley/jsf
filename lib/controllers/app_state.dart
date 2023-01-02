import 'package:get/get.dart';

class AppState {
  final showHomeFloatButton = false.obs;
  final verifyPhoneVerificationId = ''.obs;

  setShowHomeFloatButton() {
    showHomeFloatButton.value = !showHomeFloatButton.value;
  }
}
