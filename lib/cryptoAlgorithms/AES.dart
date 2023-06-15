import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

// We using  https://pub.dev/packages/encrypt
class AESLib {
  static Key generateKey({required String keyString}) {
    return Key.fromUtf8(keyString);
  }

  static generateIV({required String ivString}) {
    return IV.fromUtf8(ivString);
  }

  static Encrypted encrypt({
    required List<int> plainText,
    required Key key,
    required IV iv,
  }) {
    final encrypter = Encrypter(AES(key));
    var cipherText = encrypter.encryptBytes(plainText, iv: iv);
    return cipherText;
  }

  static Uint8List decrypt({
    required Uint8List cipherText,
    required Key key,
    required IV iv,
  }) {
    final encrypter = Encrypter(AES(key));
    Encrypted temp = Encrypted(cipherText);
    Uint8List result = Uint8List.fromList(encrypter.decryptBytes(temp, iv: iv));
    return result;
  }
}
