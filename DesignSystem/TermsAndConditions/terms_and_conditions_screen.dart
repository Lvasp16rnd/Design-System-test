import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Termos e Condições')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LinkedLabel(
            fullText: 'Ao continuar, você aceita os termos e serviços do aplicativo.',
            linkedText: 'termos e serviços',
            url: 'https://www.google.com',
          ),
        ),
      ),
    );
  }
}
