import 'package:flutter/material.dart';

class MateriaisPage extends StatelessWidget {
  final List<Map<String, dynamic>> materiais = [
    {'icon': Icons.account_balance, 'label': 'Banco de Alusões'},
    {'icon': Icons.menu_book, 'label': 'Banco de Citações'},
    {'icon': Icons.movie, 'label': 'Banco de Referências'},
    {'icon': Icons.topic, 'label': 'Banco de Temas'},
    {'icon': Icons.emoji_events, 'label': 'Redações Nota 1000'},
  ];

  Widget _buildMaterialButton(BuildContext context, Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialDetalhesPage(label: item['label']),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xFF7E64A5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(item['icon'], color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item['label'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: materiais.map((item) => _buildMaterialButton(context, item)).toList(),
          ),
        ),
      ),
    );
  }
}

class MaterialDetalhesPage extends StatelessWidget {
  final String label;

  const MaterialDetalhesPage({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Text('Detalhes sobre $label', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
