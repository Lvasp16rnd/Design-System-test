import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Samples/action_button_sample_screen.dart';
import 'package:untitled/DesignSystem/Components/Input/InputText/input_text_sample_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    InputTextSampleScreen(), // Tela de input com verificação
    ActionButtonSampleScreen(), // Tela de botões de ação
    Center(child: Text('Another Screen')), // Adicione outras telas conforme necessário
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses),
            label: 'Other',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
