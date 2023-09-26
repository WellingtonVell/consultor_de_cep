import 'package:consultor_de_cep/models/result_cep.dart';
import 'package:consultor_de_cep/widgets/result_display.dart';
import 'package:flutter/material.dart';
import 'package:consultor_de_cep/widgets/cep_input_field.dart';
import 'package:consultor_de_cep/services/via_cep_service.dart';
import 'package:consultor_de_cep/widgets/loading_indicator.dart';
import 'package:consultor_de_cep/widgets/error_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cepController = TextEditingController();
  CepResult? _cepResult;
  bool _isLoading = false;
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CepInputField(controller: _cepController),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      final cep = _cepController.text;
                      setState(() {
                        _isLoading = true;
                        _error = '';
                      });
                      try {
                        final result = await ViaCepService.fetchCEP(cep);
                        setState(() {
                          _cepResult = result;
                        });
                      } catch (e) {
                        setState(() {
                          _error = 'CEP não encontrado, Digite um CEP válido!';
                        });
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
              child: const Text('Consultar CEP'),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isLoading
                  ? const LoadingIndicator()
                  : _error.isNotEmpty
                      ? ErrorDisplay(errorMessage: _error)
                      : ResultDisplay(cepResult: _cepResult),
            )
          ],
        ),
      ),
    );
  }
}
