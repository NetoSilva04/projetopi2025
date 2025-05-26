import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DesenvolvimentoPage extends StatefulWidget {
  const DesenvolvimentoPage({super.key});

  @override
  State<DesenvolvimentoPage> createState() => _DesenvolvimentoPageState();
}

class _DesenvolvimentoPageState extends State<DesenvolvimentoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoId = 'mrbReXw2uKs'; // Video sobre desenvolvimento da redação
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _contentCard(String titulo, String descricao) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFB19CD9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              descricao,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoCard() {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFB19CD9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Center(
              child: Text(
                'Videoaula: Como desenvolver a redação do ENEM',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.deepPurple,
              progressColors: const ProgressBarColors(
                playedColor: Colors.deepPurple,
                handleColor: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'DESENVOLVIMENTO DA REDAÇÃO',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xFFB19CD9),
      ),
      body: ListView(
        children: [
          _contentCard(
            'O que é o desenvolvimento?',
            'É a parte central da redação. Aqui você deve apresentar e argumentar sobre os pontos de vista relacionados ao tema proposto.',
          ),
          _contentCard(
            'O que deve conter?',
            'Deve conter argumentos bem fundamentados, uso de repertório sociocultural, dados e exemplos que sustentem a tese apresentada na introdução.',
          ),
          _contentCard(
            'Como organizar os parágrafos?',
            'Cada parágrafo deve tratar de um argumento específico. Use conectivos para garantir coesão e coerência. Ex: "Em primeiro lugar", "Além disso", "Por outro lado".',
          ),
          _contentCard(
            'Por que ter dois parágrafos de desenvolvimento?',
            'Ter dois parágrafos permite aprofundar melhor o tema com dois argumentos distintos. Isso demonstra domínio do conteúdo, articulação de ideias e garante maior pontuação nas competências do ENEM.',
          ),
          _contentCard(
            'Desenvolvimento 1: primeiro argumento',
            'No primeiro parágrafo de desenvolvimento, apresente seu argumento principal. Justifique com fatos, dados, citações ou contextos históricos. Construa uma ideia sólida e bem conectada com a tese.',
          ),
          _contentCard(
            'Desenvolvimento 2: contraponto ou segundo argumento',
            'No segundo parágrafo, você pode reforçar sua tese com outro argumento ou apresentar um contraponto, desde que o refute de forma crítica. Isso demonstra repertório e pensamento analítico.',
          ),
          _videoCard(),
        ],
      ),
    );
  }
}
