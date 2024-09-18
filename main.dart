import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Samples/action_button_sample_screen.dart';
import 'package:untitled/DesignSystem/Components/Input/InputText/input_text_sample_screen.dart';
import 'package:untitled/DesignSystem/Samples/bottom_navigation_bar_screen.dart';
import 'package:untitled/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:untitled/DesignSystem/TermsAndConditions/terms_and_conditions_screen.dart'; // Corrija a importação


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationBarScreen(), // Tela principal com o BottomNavigationBar
    );
  }
}

// Criação da BottomNavigationBarScreen
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MainScreen(), // Tela principal com as tabs
    TermsAndConditionsScreen(), // Tela de Termos e Condições
    Center(child: Text('School Screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
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
        title: const Text('Flutter Demo with BottomNavigationBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.privacy_tip),
            label: 'Termos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Criação da MainScreen com tabs
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo with Tabs'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Action Buttons'),
            Tab(text: 'Input Text Verification'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ActionButtonSampleScreen(), // Primeira tab
          InputTextSampleScreen(), // Segunda tab com input
        ],
      ),
    );
  }
}
