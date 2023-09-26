import 'package:consultor_de_cep/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.deepPurple),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}