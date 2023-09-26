import 'package:flutter/material.dart';
import 'package:consultor_de_cep/models/result_cep.dart';

class ResultDisplay extends StatelessWidget {
  final CepResult? cepResult;

  const ResultDisplay({
    Key? key,
    this.cepResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cepResult == null) {
      return const SizedBox.shrink(); // Não exibe nada se o resultado for nulo
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField('CEP:', cepResult!.cep),
        _buildField('Logradouro:', cepResult!.logradouro),
        _buildField('Bairro:', cepResult!.bairro),
        _buildField('Localidade:', cepResult!.localidade),
        _buildField('UF:', cepResult!.uf),
      ],
    );
  }
  
  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
