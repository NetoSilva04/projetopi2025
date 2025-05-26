import 'package:flutter/material.dart';

class TemaPage extends StatefulWidget {
  final String tipoInicial;

  const TemaPage({super.key, this.tipoInicial = ''});

  @override
  State<TemaPage> createState() => _TemaPageState();
}

class _TemaPageState extends State<TemaPage> {
  late String tipoSelecionado;
  String filtroTitulo = '';

  final List<Map<String, String>> temas = [
    {"titulo": "Redação  Enem - Livre", "tipo": "Enem"},
    {"titulo": "Redação  Vestibular - Livre", "tipo": "Vestibular"},
    {"titulo": "Redação  Concurso - Livre", "tipo": "Concurso"},
    {
      "titulo": "A Mulher e a Sociedade Contemporânea",
      "tipo": "Enem",
      "apoio": "Ver textos motivadores completos na página."
    },
    {
      "titulo":  "A persistência da violência contra a mulher na sociedade brasileira",
      "tipo": "Enem ",
      "apoio": "Ver textos motivadores completos na página."
    },

     {
      "titulo":  "Manipulação do comportamento do usuário pelo controle de dados na internet",
      "tipo": "Enem ",
      "apoio": "Ver textos motivadores completos na página."
    },

     {
      "titulo":  "Desafios para a valorização de comunidades e povos tradicionais no Brasil",
      "tipo": "Enem ",
      "apoio": "Ver textos motivadores completos na página."
    },
    {
      "titulo":  "O papel da ética no serviço público brasileiro",
      "tipo": "concurso",
      "apoio": "Ver textos motivadores completos na página."
    },
    {
      "titulo":  "O mundo contemporâneo está fora da ordem",
      "tipo": "vestibular",
      "apoio": "Ver textos motivadores completos na página."
    },
  ];

  @override
  void initState() {
    super.initState();
    tipoSelecionado = widget.tipoInicial;
  }

  @override
  Widget build(BuildContext context) {
    final temasFiltrados = temas.where((tema) {
      final tipoOk = tipoSelecionado.isEmpty || tema['tipo'] == tipoSelecionado;
      final tituloOk = tema['titulo']!.toLowerCase().contains(filtroTitulo.toLowerCase());
      return tipoOk && tituloOk;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('BANCOS DE TEMAS'))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.deepPurple.shade100,
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: tipoSelecionado.isNotEmpty ? tipoSelecionado : null,
                    hint: const Text('Selecione um tipo'),
                    items: ['Enem', 'Vestibular', 'Concurso']
                        .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        tipoSelecionado = value ?? '';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Filtrar pelo título'),
                    onChanged: (value) {
                      setState(() {
                        filtroTitulo = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: temasFiltrados.map((tema) {
                return GestureDetector(
                  onTap: () {
                    if (tema['titulo'] == "A Mulher e a Sociedade Contemporânea") {
                      Navigator.pushNamed(context, '/redacao');
                    }
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.deepPurple.shade50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.book, size: 48, color: Colors.deepPurple),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            tema['titulo']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
