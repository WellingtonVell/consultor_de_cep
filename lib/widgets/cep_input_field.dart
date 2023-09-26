import 'package:flutter/material.dart';
import 'package:consultor_de_cep/models/cep_input_formater.dart';

class CepInputField extends StatelessWidget {
  final TextEditingController controller;

  const CepInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [CepInputFormatter()],
      decoration: const InputDecoration(labelText: 'CEP'),
      keyboardType: TextInputType.number,
    );
  }
}
