// main.dart
import 'package:flutter/material.dart';
import 'screens/recomendacoes_screen.dart';
import 'screens/senhas_screen.dart';
import 'screens/permission_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AlertasRecomendacoesScreen(),
    const SenhasScreen(),
    PermissionListScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_rounded),
            label: 'Recomendações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Senhas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Permissões',
          ),
        ],
      ),
    );
  }
}
