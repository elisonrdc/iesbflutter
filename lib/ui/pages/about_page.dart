import 'package:flutter/material.dart';
import 'package:iesbflutter/ui/widgets/row_about.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            RowAbout(text: 'Aplicativo desenvolvido para a avaliação final da disciplina "Desenvolvimento para Flutter", do Curso de Especialização em Aplicativos Móveis do IESB NORTE, Brasília/DF.'),
            const Padding(padding: EdgeInsets.all(10)),
            RowAbout(icon: Icons.person, text: 'Elison Ribeiro Durães Coelho'),
            RowAbout(icon: Icons.email, text: 'elison.coelho@iesb.edu.br'),
            RowAbout(icon: Icons.phone, text: '(61) 99385-9076 (WhatsApp)'),
          ],
        ),
      ),
    );
  }
}
