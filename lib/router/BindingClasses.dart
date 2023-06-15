import 'package:cryptography_system/controllers/AESPageController.dart';
import 'package:cryptography_system/controllers/RSApageController.dart';
import 'package:get/get.dart';

class RSApageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class RSAEncryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class RSADecryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class RSASigningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class RSAVerifyingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class AESPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AESPageController());
  }
}

class AESEncryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AESPageController());
  }
}

class AESDecryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AESPageController());
  }
}
