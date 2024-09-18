import 'package:flutter/material.dart';
import '../Components/Input/InputText/input_text.dart';
import '../Components/Input/InputText/input_text.dart';

class EmailInputSampleScreen extends StatefulWidget {
  @override
  _EmailInputSampleScreenState createState() => _EmailInputSampleScreenState();
}

class _EmailInputSampleScreenState extends State<EmailInputSampleScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Input Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(
                controller: _emailController,
                hint: 'Enter your email',
                validator: emailValidator,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email is valid')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
