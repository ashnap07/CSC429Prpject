import 'dart:typed_data';
import 'package:fast_rsa/fast_rsa.dart';

class RSALib {
  RSALib();

  static Future<KeyPair> generateKey({
    required int numberOfBits,
  }) async {
    return await RSA.generate(numberOfBits);
  }

  static Future<Uint8List> encrypt({
    required Uint8List plaintext,
    required String publicKey,
  }) async {
    var ciphertext = await RSA.encryptPKCS1v15Bytes(plaintext, publicKey);
    return ciphertext;
  }

  static Future<Uint8List> decrypt({
    required Uint8List ciphertext,
    required String privateKey,
  }) async {
    var plaintext = await RSA.decryptPKCS1v15Bytes(ciphertext, privateKey);
    return plaintext;
  }

  static Future<Uint8List> sign({
    required Uint8List plaintext,
    required String privateKey,
  }) async {
    var signature =
        await RSA.signPKCS1v15Bytes(plaintext, Hash.SHA256, privateKey);
    return signature;
  }

  static Future<bool> verify({
    required Uint8List signature,
    required Uint8List plaintext,
    required String publicKey,
  }) async {
    try {
      bool verified = await RSA.verifyPKCS1v15Bytes(
        signature,
        plaintext,
        Hash.SHA256,
        publicKey,
      );
      return verified;
    } catch (e) {
      return false;
    }
  }
}
