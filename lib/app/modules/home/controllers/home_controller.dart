import 'package:aes/app/utils/aeseverywhere.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final GlobalKey<FormState> encryptFormKey = GlobalKey();
  final GlobalKey<FormState> decryptFormKey = GlobalKey();

  String textForEncrypt = '';
  String passphraseForEncrypt = '';
  final RxString encrypted = ''.obs;

  String textForDecrypt = '';
  String passphraseForDecrypt = '';
  final RxString decrypted = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapEncrypt() {
    if (encryptFormKey.currentState!.validate()) {
      encryptFormKey.currentState!.save();
      try {
        final result = Aes256.encrypt(
          textForEncrypt,
          passphraseForEncrypt,
        );
        encrypted(result);
      } catch (error) {
        decrypted('Invalid Value');
      }
    }
  }

  void onTapDecrypt() {
    if (decryptFormKey.currentState!.validate()) {
      decryptFormKey.currentState!.save();
      try {
        final result = Aes256.decrypt(
          textForDecrypt,
          passphraseForDecrypt,
        );
        decrypted(result);
      } catch (error) {
        decrypted('Invalid Value');
      }
    }
  }

  void onTapCopy(String text) async {
    if (text.isEmpty) {
      return;
    }

    await Clipboard.setData(
      ClipboardData(text: text),
    );
    HapticFeedback.lightImpact();
    Get.snackbar(
      'Copy',
      text,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
      maxWidth: 480,
      margin: const EdgeInsets.all(16),
      backgroundColor: Colors.black45,
    );
  }
}
