import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PermissionListScreen extends StatefulWidget {
  @override
  _PermissionListScreenState createState() => _PermissionListScreenState();
}

class _PermissionListScreenState extends State<PermissionListScreen> {
  final List<Map<String, dynamic>> apps = [
    {
      'name': 'WhatsApp',
      'icon': Icons.message,
      'color': Colors.green,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Telegram',
      'icon': Icons.message,
      'color': Colors.blueAccent,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': true,
    },
    {
      'name': 'Messenger',
      'icon': Icons.chat,
      'color': Colors.blue,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Discord',
      'icon': Icons.voice_chat,
      'color': Colors.indigo,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Snapchat',
      'icon': Icons.camera_alt,
      'color': Colors.yellow,
      'permissions': {
        'Câmera': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': true,
    },
    {
      'name': 'WeChat',
      'icon': Icons.chat_bubble_outline,
      'color': Colors.greenAccent,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Signal',
      'icon': Icons.lock_outline,
      'color': Colors.blueGrey,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Viber',
      'icon': Icons.phone,
      'color': Colors.purpleAccent,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Line',
      'icon': Icons.alternate_email,
      'color': Colors.lightGreen,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Kik',
      'icon': Icons.chat_bubble,
      'color': Colors.lightBlueAccent,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': true,
    },
    {
      'name': 'Slack',
      'icon': Icons.work_outline,
      'color': Colors.purple,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Threema',
      'icon': Icons.lock,
      'color': Colors.grey,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': true,
    },
    {
      'name': 'Google Hangouts',
      'icon': Icons.video_call,
      'color': Colors.green,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'Skype',
      'icon': Icons.video_call,
      'color': Colors.lightBlue,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': false,
    },
    {
      'name': 'GroupMe',
      'icon': Icons.group,
      'color': Colors.teal,
      'permissions': {
        'Câmera': false,
        'Microfone': false,
        'Localização': false,
        'Contatos': false,
      },
      'excessivePermissions': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacidade e Segurança',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: apps.map((app) => _buildAppTile(app)).toList(),
      ),
    );
  }

  Widget _buildAppTile(Map<String, dynamic> app) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            backgroundColor: app['color'],
            child: Icon(app['icon'], color: Colors.white),
          ),
          title: Text(
            app['name'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPermissionSwitch('Câmera', app),
              _buildPermissionSwitch('Microfone', app),
              _buildPermissionSwitch('Localização', app),
              _buildPermissionSwitch('Contatos', app),
            ],
          ),
          trailing: Tooltip(
            message: app['excessivePermissions']
                ? 'Permissões Excessivas'
                : 'Permissões Adequadas',
            child: app['excessivePermissions']
                ? Icon(Icons.warning, color: Colors.red)
                : Icon(Icons.check_circle, color: Colors.green),
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionSwitch(String permission, Map<String, dynamic> app) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          permission,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        CupertinoSwitch(
          value: app['permissions'][permission] ?? false,
          onChanged: (bool value) {
            setState(() {
              app['permissions'][permission] = value;
            });
          },
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}
