import 'package:aes/app/global_widgets/input_text_form_field.dart';
import 'package:aes/app/modules/home/controllers/home_controller.dart';
import 'package:aes/app/utils/form_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: controller.scrollController,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: _body(),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _encryptForm(),
          const SizedBox(height: 32),
          _decryptForm(),
        ],
      ),
    );
  }

  Widget _encryptForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: controller.encryptFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Encrypt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            InputTextFormField(
              label: 'Text for Encrypt',
              minLines: 2,
              maxLines: 4,
              validator: FormValidator.notEmpty,
              onSaved: (newValue) {
                controller.textForEncrypt = newValue ?? '';
              },
            ),
            const SizedBox(height: 24),
            InputTextFormField(
              label: 'Passphrase for Encrypt',
              minLines: 2,
              maxLines: 4,
              validator: FormValidator.notEmpty,
              onSaved: (newValue) {
                controller.passphraseForEncrypt = newValue ?? '';
              },
            ),
            const SizedBox(height: 24),
            Obx(() {
              final encrypted = controller.encrypted.value;
              return _result(encrypted);
            }),
            const SizedBox(height: 24),
            SizedBox(
              height: 44,
              child: FilledButton(
                onPressed: controller.onTapEncrypt,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Encrypt'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _decryptForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: controller.decryptFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Decrypt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            InputTextFormField(
              label: 'Text for Decrypt',
              minLines: 2,
              maxLines: 4,
              validator: FormValidator.notEmpty,
              onSaved: (newValue) {
                controller.textForDecrypt = newValue ?? '';
              },
            ),
            const SizedBox(height: 24),
            InputTextFormField(
              label: 'Passphrase for Decrypt',
              minLines: 2,
              maxLines: 4,
              validator: FormValidator.notEmpty,
              onSaved: (newValue) {
                controller.passphraseForDecrypt = newValue ?? '';
              },
            ),
            const SizedBox(height: 24),
            Obx(() {
              final decrypted = controller.decrypted.value;
              return _result(decrypted);
            }),
            const SizedBox(height: 24),
            SizedBox(
              height: 44,
              child: FilledButton(
                onPressed: controller.onTapDecrypt,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Decrypt'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _result(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SelectableText(
                text,
              ),
            ),
          ),
          IconButton(
            onPressed: () => controller.onTapCopy(text),
            icon: const Icon(
              CupertinoIcons.doc_on_doc,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
