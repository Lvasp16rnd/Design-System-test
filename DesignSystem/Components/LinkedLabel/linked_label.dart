import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';  // Import para o TapGestureRecognizer
import 'package:url_launcher/url_launcher.dart';  // Import para o url_launcher

class LinkedLabel extends StatelessWidget {
  final String fullText;
  final String linkedText;
  final String url;

  const LinkedLabel({
    Key? key,
    required this.fullText,
    required this.linkedText,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dividir o texto baseado no texto do link
    final startText = fullText.split(linkedText)[0];
    final endText = fullText.split(linkedText).length > 1 ? fullText.split(linkedText)[1] : '';

    return RichText(
      text: TextSpan(
        text: startText,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: linkedText,
            style: const TextStyle(
              color: Colors.blue,  // Cor do link
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _launchURL(url);
              },
          ),
          TextSpan(
            text: endText,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Função para lançar o URL
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
