class FormValidator {
  static String? isRequired(String? str, {String fieldName = 'This field'}) {
    if (str == null || str.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }
}
