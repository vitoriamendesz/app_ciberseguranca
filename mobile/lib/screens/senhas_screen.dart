import 'package:flutter/material.dart';

class SenhasScreen extends StatelessWidget {
  const SenhasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Armazenamento de Senhas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            PasswordCard(
              title: 'Instagram',
              password: 'Password1234',
              icon: Icons.camera_alt,
              color: Colors.purple,
            ),
            PasswordCard(
              title: 'Banco',
              password: 'Password4321',
              icon: Icons.account_balance,
              color: Colors.blue,
            ),
            PasswordCard(
              title: 'Gmail',
              password: 'Password0000',
              icon: Icons.email,
              color: Colors.orange,
            ),
            PasswordCard(
              title: 'Facebook',
              password: 'Password5678',
              icon: Icons.facebook,
              color: Colors.blueAccent,
            ),
            PasswordCard(
              title: 'Twitter',
              password: 'Password8765',
              icon: Icons.alternate_email,
              color: Colors.lightBlue,
            ),
            PasswordCard(
              title: 'LinkedIn',
              password: 'Password2468',
              icon: Icons.business,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordCard extends StatefulWidget {
  final String title;
  final String password;
  final IconData icon;
  final Color color;

  const PasswordCard({
    super.key,
    required this.title,
    required this.password,
    required this.icon,
    required this.color,
  });

  @override
  _PasswordCardState createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showPasswordDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordDetailScreen(
          title: widget.title,
          password: widget.password,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: widget.color,
            child: Icon(widget.icon, color: Colors.white),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            _isPasswordVisible ? widget.password : '********',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          onTap: _showPasswordDetails,
        ),
      ),
    );
  }
}

class PasswordDetailScreen extends StatelessWidget {
  final String title;
  final String password;

  const PasswordDetailScreen({
    super.key,
    required this.title,
    required this.password,
  });

  String _evaluatePasswordStrength(String password) {
    if (password.length < 6) return 'Senha muito fraca';
    if (password.length < 8 || password.contains(RegExp(r'^[a-zA-Z]+$'))) return 'Senha fraca';
    if (password.contains(RegExp(r'^[a-zA-Z0-9]+$'))) return 'Senha média';
    return 'Senha forte';
  }

  List<String> _getPasswordSuggestions(String strength) {
    switch (strength) {
      case 'Senha muito fraca':
        return ['Adicione mais caracteres', 'Inclua números e símbolos'];
      case 'Senha fraca':
        return ['Inclua letras maiúsculas', 'Adicione números ou caracteres especiais'];
      case 'Senha média':
        return ['Inclua caracteres especiais', 'Aumente o comprimento da senha'];
      default:
        return ['Boa senha! Mantenha-a segura'];
    }
  }

  double _getStrengthProgress(String strength) {
    switch (strength) {
      case 'Senha muito fraca':
        return 0.25;
      case 'Senha fraca':
        return 0.5;
      case 'Senha média':
        return 0.75;
      case 'Senha forte':
        return 1.0;
      default:
        return 0.0;
    }
  }

  Color _getStrengthColor(String strength) {
    switch (strength) {
      case 'Senha muito fraca':
        return Colors.red;
      case 'Senha fraca':
        return Colors.orange;
      case 'Senha média':
        return Colors.yellow[700]!; // Alterado para amarelo mais suave
      case 'Senha forte':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    String strength = _evaluatePasswordStrength(password);
    double progress = _getStrengthProgress(strength);
    Color strengthColor = _getStrengthColor(strength);
    List<String> suggestions = _getPasswordSuggestions(strength);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes da Senha - $title",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senha: $password',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Força da Senha: $strength',
                  style: TextStyle(fontSize: 16, color: strengthColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  color: strengthColor,
                  backgroundColor: Colors.grey[300],
                  minHeight: 8,
                ),
                const SizedBox(height: 16),
                Text(
                  'Sugestões para Melhorar a Senha:',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...suggestions.map((suggestion) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),
                          Text(suggestion, style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}