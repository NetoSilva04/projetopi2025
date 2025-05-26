import 'package:flutter/material.dart';
import 'package:projetopi/inicio_screens/conceitos_basicos_page.dart';
import 'package:projetopi/inicio_screens/desenvolvimento_page.dart';
import 'package:projetopi/inicio_screens/conclusao_page.dart';
import 'package:projetopi/inicio_screens/dicasExtras_page.dart';
import 'package:projetopi/inicio_screens/introducao_page.dart';
import 'package:projetopi/inicio_screens/competencias_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> cards = [
    {'title': 'Conceitos Básicos', 'icon': '1'},
    {'title': '5 Competências', 'icon': '2'},
    {'title': 'Introdução', 'icon': '3'},
    {'title': 'Desenvolvimento', 'icon': '4'},
    {'title': 'Conclusão', 'icon': '5'},
    {'title': 'Dicas Extras', 'icon': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá, estudante :)',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: cards.map((card) {
                    return InkWell(
                      onTap: () {
                        Widget nextPage;

                        switch (card['title']) {
                          case 'Conceitos Básicos':
                            nextPage = ConceitosBasicosPage();
                            break;
                          case '5 Competências':
                            nextPage = CompetenciasPage();
                            break;
                          case 'Introdução':
                            nextPage = IntroPage();
                            break;
                          case 'Desenvolvimento':
                            nextPage = DesenvolvimentoPage();
                            break;
                          case 'Conclusão':
                            nextPage = ConclusaoPage();
                            break;
                          case 'Dicas Extras':
                            nextPage = DicasExtrasPage();
                            break;
                          default:
                            nextPage = Scaffold(
                              body: Center(child: Text('Página não encontrada')),
                            );
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nextPage),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFB3A5D2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _getIconForCard(card['title']!),
                              const SizedBox(height: 8),
                              Text(
                                card['title']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconForCard(String title) {
    IconData iconData;

    switch (title) {
      case 'Conceitos Básicos':
        iconData = Icons.book;
        break;
      case '5 Competências':
        iconData = Icons.school;
        break;
      case 'Introdução':
        iconData = Icons.insert_drive_file;
        break;
      case 'Desenvolvimento':
        iconData = Icons.create;
        break;
      case 'Conclusão':
        iconData = Icons.check_circle;
        break;
      case 'Dicas Extras':
        iconData = Icons.lightbulb;
        break;
      default:
        iconData = Icons.help_outline;
        break;
    }

    return Icon(iconData, size: 40, color: Colors.yellowAccent);
  }
}
