import 'package:cryptography_system/router/BindingClasses.dart';
import 'package:cryptography_system/views/AESDecryptionPage.dart';
import 'package:cryptography_system/views/AESPage.dart';
import 'package:cryptography_system/views/AESEncryptionPage.dart';
import 'package:cryptography_system/views/RSADecryptionPage.dart';
import 'package:cryptography_system/views/RSAEncryptionPage.dart';
import 'package:cryptography_system/views/RSASigningPage.dart';
import 'package:cryptography_system/views/RSAVerifyingPage.dart';
import 'package:cryptography_system/views/RSApage.dart';
import 'package:cryptography_system/views/homepage.dart';
import 'package:get/get.dart';

List<GetPage> routerApp = [
  GetPage(
    name: Routes.homepage,
    page: () => Homepage(),
  ),
  GetPage(
    name: Routes.RSAPage,
    page: () => RSAPage(),
    binding: RSApageBinding(),
  ),
  GetPage(
    name: Routes.RSAEncryptionPage,
    page: () => RSAEncryptionPage(),
    binding: RSAEncryptionBinding(),
  ),
  GetPage(
    name: Routes.RSADecryptionPage,
    page: () => RSADecryptionPage(),
    binding: RSADecryptionBinding(),
  ),
  GetPage(
    name: Routes.RSASigningPage,
    page: () => RSASigningPage(),
    binding: RSASigningBinding(),
  ),
  GetPage(
    name: Routes.RSAVerifyingPage,
    page: () => RSAVerifyingPage(),
    binding: RSAVerifyingBinding(),
  ),
  GetPage(
    name: Routes.AESPage,
    page: () => AESPage(),
    binding: AESPageBinding(),
  ),
  GetPage(
    name: Routes.AESEncryptionPage,
    page: () => AESEncryptionPage(),
    binding: AESEncryptionBinding(),
  ),
  GetPage(
    name: Routes.AESDecryptionPage,
    page: () => AESDecryptionPage(),
    binding: AESDecryptionBinding(),
  ),
];

class Routes {
  static String homepage = "/homepage";
  static String RSAPage = "/RSAPage";
  static String RSAEncryptionPage = "/RSAEncryptionPage";
  static String RSADecryptionPage = "/RSADecryptionPage";
  static String RSASigningPage = "/RSASigningPage";
  static String RSAVerifyingPage = "/RSAVerifyingPage";
  static String AESPage = "/AESPage";
  static String AESEncryptionPage = "/AESEncryptionPage";
  static String AESDecryptionPage = "/AESDecryptionPage";
}
