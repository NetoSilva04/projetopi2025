import 'package:flutter/material.dart';
import 'texto_motivador_widget.dart';

class RedacaoPage extends StatelessWidget {
  const RedacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A mulher e a sociedade contemporânea'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/mulher.png'), // imagem de apoio
            const SizedBox(height: 16),
            const Text(
              'INSTRUÇÕES PARA REDAÇÃO',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 10),
            const Text(
              '''O rascunho da redação deve ser feito no espaço apropriado.
O texto definitivo deve ser escrito à tinta, na folha própria, em até 30 linhas.
A redação que apresentar cópia dos textos da Proposta de Redação ou do Caderno de Questões terá o número de linhas copiadas desconsiderado para efeito de correção.
Receberá nota zero, em qualquer das situações expressas a seguir, a redação que:

- Tiver até 7 (sete) linhas escritas, sendo considerada texto insuficiente.
- Fugir ao tema ou que não atender ao tipo dissertativo-argumentativo.
- Apresentar proposta de intervenção que desrespeite os direitos humanos.
- Apresentar parte do texto deliberadamente desconectada ao tema proposto.''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 156, 114, 255)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Textos motivadores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const TextoMotivadorWidget(
              titulo: 'Texto 01',
              conteudo:
                  'É fato que as conquistas femininas ao longo dos anos surgiram como um protesto de igualdade nas relações trabalhistas... '
                  '\n\nFonte: https://www.jusbrasil.com.br/artigos/o-papel-da-mulher-na-sociedade-contemporanea/859757616',
            ),
            const SizedBox(height: 20),
            const TextoMotivadorWidget(
              titulo: 'Texto 02',
              conteudo:
                  'A importância da mulher na sociedade contemporânea é vista na imensidão de campos sociais... '
                  'Esses espaços sociais são enriquecidos por essa diversidade.',
            ),
            const SizedBox(height: 20),
            const TextoMotivadorWidget(
              titulo: 'Texto 03',
              conteudo:
                  'Além disso, a luta das mulheres por direitos igualitários fortaleceu políticas públicas e avanços legislativos...',
            ),
            SizedBox(height: 10),
Center(
  child: Container(
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: const Text('Enviar redação',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
    ),
  ),
)


          ],
        ),
      ),
    );
  }
}