import 'package:consultor_de_cep/services/api_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:consultor_de_cep/services/via_cep_service.dart';

void main() {
  group('ViaCepService Tests', () {
    test('fetchCEP should return a CepResult for a valid CEP', () async {
      const validCep = '01001-001';
      final result = await ViaCepService.fetchCEP(validCep);

      expect(result, isNotNull);
      expect(result.cep, validCep);
    });

    test('fetchCEP should throw a BadRequestException for an invalid CEP', () async {
      const invalidCep = '01001-0021';
      
      try {
        await ViaCepService.fetchCEP(invalidCep);
      } catch (e) {
        expect(e, isInstanceOf<BadRequestException>());
      }
    });
  });
}