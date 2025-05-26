import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ConclusaoPage extends StatefulWidget {
  const ConclusaoPage({super.key});

  @override
  State<ConclusaoPage> createState() => _ConclusaoPageState();
}

class _ConclusaoPageState extends State<ConclusaoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoId = 'PdAq16xZZj0';
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
                'Videoaula: Como fazer a conclusão da redação',
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
            'CONCLUSÃO DA REDAÇÃO',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xFFB19CD9),
      ),
      body: ListView(
        children: [
          _contentCard(
            'O que é a conclusão?',
            'A conclusão é a última parte da redação, onde você precisa retomar a tese apresentada e sintetizar os principais pontos discutidos no desenvolvimento, fechando com uma solução ou reflexão sobre o tema.',
          ),
          _contentCard(
            'O que deve conter na conclusão?',
            'Na conclusão, deve-se reforçar a tese de forma clara, demonstrando como a argumentação foi construída. Muitas vezes, é importante apresentar uma solução para o problema abordado ou uma reflexão final sobre o tema.',
          ),
          _contentCard(
            'Como concluir efetivamente?',
            'Evite novos argumentos na conclusão. Ela deve ser uma síntese, não um novo desenvolvimento. Use frases que confirmem sua opinião e direcionem o leitor para o fim lógico da discussão.',
          ),
          _contentCard(
            'Importância de uma boa conclusão',
            'Uma conclusão eficaz é essencial para mostrar ao corretor que o aluno soube fechar seu raciocínio. Ela sintetiza o conteúdo e reforça a argumentação, deixando uma boa impressão sobre a redação.',
          ),
          _videoCard(),
        ],
      ),
    );
  }
}
