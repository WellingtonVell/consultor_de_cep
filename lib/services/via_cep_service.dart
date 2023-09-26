import 'dart:convert';
import 'package:consultor_de_cep/services/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:consultor_de_cep/models/result_cep.dart';

class ViaCepService {
  static Future<CepResult> fetchCEP(String cep) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CepResult(
        cep: data['cep'],
        logradouro: data['logradouro'],
        bairro: data['bairro'],
        localidade: data['localidade'],
        uf: data['uf'],
      );

    } else if (response.statusCode == 400) {
      throw BadRequestException('CEP inválido.');
    } else if (response.statusCode == 404) {
      throw NotFoundException('CEP não encontrado.');
    } else {
      throw ServerErrorException('Erro ao carregar o CEP.');
    }
  }
}