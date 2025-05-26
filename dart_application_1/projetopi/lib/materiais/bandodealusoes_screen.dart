import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AlusoesHistoricasPage extends StatefulWidget {
  const AlusoesHistoricasPage({super.key});

  @override
  State<AlusoesHistoricasPage> createState() => _AlusoesHistoricasPageState();
}

class _AlusoesHistoricasPageState extends State<AlusoesHistoricasPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoId = 'QgQPBvmYRM4';
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

  Widget _alusionCard(String titulo, String descricao) {
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
                'Videoaula: Como usar alusões históricas na redação',
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
        centerTitle: true,
        title: const Text(
          'BANCO DE ALUSÕES HISTÓRICAS',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFB19CD9),
      ),
      body: ListView(
        children: [
          _videoCard(),
          _alusionCard(
            'Revolução Francesa (1789)',
            'A Revolução Francesa marcou a luta contra a desigualdade e a tirania. A ideia de “liberdade, igualdade e fraternidade” pode ser usada para discutir justiça social, direitos civis ou desigualdade econômica. Exemplo de tema: desigualdade social no Brasil.',
          ),
          _alusionCard(
            'Holocausto Nazista',
            'O genocídio de milhões de judeus durante a Segunda Guerra Mundial alerta sobre os perigos da intolerância e do discurso de ódio. Exemplo de tema: intolerância religiosa ou discurso de ódio nas redes sociais.',
          ),
          _alusionCard(
            'Apartheid na África do Sul',
            'Sistema de segregação racial. Pode ser citado em temas sobre racismo e desigualdade racial. Exemplo de tema: o racismo estrutural no Brasil.',
          ),
          _alusionCard(
            'Ditadura Militar no Brasil (1964–1985)',
            'Usado para discutir censura, repressão e liberdade de expressão. Exemplo de tema: limites da liberdade de expressão na democracia.',
          ),
          _alusionCard(
            'Iluminismo',
            'Movimento intelectual do século XVIII. Relacionado à educação, ciência e participação política. Exemplo de tema: a importância da educação na formação cidadã.',
          ),
          _alusionCard(
            'Revolução Industrial',
            'Mudanças tecnológicas e sociais. Relacionado ao impacto da tecnologia. Exemplo de tema: os impactos da tecnologia nas relações de trabalho.',
          ),
          _alusionCard(
            'Movimento Feminista',
            'Luta por igualdade de gênero. Útil em temas sobre violência de gênero ou empoderamento feminino. Exemplo de tema: desafios enfrentados pelas mulheres no mercado de trabalho.',
          ),
          _alusionCard(
            'Declaração Universal dos Direitos Humanos (1948)',
            'Documento que afirma direitos fundamentais. Exemplo de tema: violação de direitos humanos na sociedade contemporânea.',
          ),
          _alusionCard(
            'Primavera Árabe',
            'Protestos por democracia no mundo árabe. Relacionado à mobilização social. Exemplo de tema: o papel dos jovens nas transformações sociais.',
          ),
          _alusionCard(
            'Movimento Negro Americano (anos 60)',
            'Liderado por Martin Luther King Jr., lutava por igualdade racial. Exemplo de tema: racismo e ativismo social.',
          ),
        ],
      ),
    );
  }
}
