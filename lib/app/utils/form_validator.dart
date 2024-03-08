class FormValidator {
  static String? notEmpty(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    } else {
      return 'Required';
    }
  }
}
