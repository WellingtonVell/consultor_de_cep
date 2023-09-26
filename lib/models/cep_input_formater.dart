import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), ''); // Remove caracteres não numéricos
    final maskedText = cleanText.replaceAllMapped(RegExp(r'^(\d{5})(\d{1,3})'), (match) {
      return '${match[1]}-${match[2]}';
    });

    return TextEditingValue(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }
}