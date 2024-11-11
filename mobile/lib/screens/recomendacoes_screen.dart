import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'permission_list.dart'; // Importe a tela de permissões

class AlertasRecomendacoesScreen extends StatelessWidget {
  const AlertasRecomendacoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alertas e Recomendações',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dicas de Segurança
              const Text(
                'Dicas de Segurança',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildRecommendationCard(
                'Habilite a Autenticação de Dois Fatores',
                'Ative a autenticação de dois fatores (2FA) para aumentar a segurança das suas contas.',
                Icons.shield,
                Colors.green,
              ),
              _buildRecommendationCard(
                'Use um Gerenciador de Senhas',
                'Guarde suas senhas em um gerenciador seguro. Evite armazenar senhas em notas ou documentos desprotegidos.',
                Icons.lock,
                Colors.blue,
              ),
              _buildRecommendationCard(
                'Atualize Suas Senhas Regularmente',
                'Mude suas senhas periodicamente, especialmente para contas importantes.',
                Icons.refresh,
                Colors.orange,
              ),
              _buildRecommendationCard(
                'Verifique as Permissões dos Apps',
                'Revise as permissões concedidas aos aplicativos e remova acessos desnecessários.',
                Icons.settings,
                Colors.purple,
                onTap: () {
                  // Navegar para a tela de permissões ao clicar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PermissionListScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Alertas Importantes
              const Text(
                'Alertas Importantes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildAlertCard(
                'Acesso Indevido Detectado',
                'Foi detectado um acesso suspeito à sua conta. Alterar a senha imediatamente.',
                Icons.warning,
                Colors.red,
              ),
              _buildAlertCard(
                'Tentativa de Login Falhou',
                'Várias tentativas de login falharam. Considere ativar 2FA.',
                Icons.error,
                Colors.redAccent,
              ),
              const SizedBox(height: 20),

              // Histórico de Alterações
              const Text(
                'Histórico de Alterações',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              _buildHistoryCard(
                'Permissão de Câmera no WhatsApp Alterada',
                'Agora a permissão de Câmera está habilitada.',
                Icons.camera_alt,
                Colors.blue,
              ),
              _buildHistoryCard(
                'Autenticação de Dois Fatores no Telegram Habilitada',
                'Você ativou a autenticação de dois fatores.',
                Icons.security,
                Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(String title, String message, IconData icon, Color iconColor, {void Function()? onTap}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        trailing: Icon(Icons.arrow_forward, color: iconColor),
        onTap: onTap, // Adiciona a navegação quando o card for tocado
      ),
    );
  }

  Widget _buildAlertCard(String title, String message, IconData icon, Color iconColor) {
    return Card(
      color: Colors.red[50],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        subtitle: Text(message, style: const TextStyle(color: Colors.red)),
        trailing: Icon(Icons.arrow_forward, color: iconColor),
      ),
    );
  }

  Widget _buildHistoryCard(String title, String message, IconData icon, Color iconColor) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
      ),
    );
  }
}
