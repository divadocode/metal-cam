// traz as ferramentas de interface do Flutter
import 'package:flutter/material.dart';

// importa a página do menu, pra poder voltar pra ela
import 'menu_page.dart';

// define a tela "Saiba Mais"
class SaibaMaisPage extends StatelessWidget {
  const SaibaMaisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15417B), // fundo azul (#15417B)
      
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6E3), // barra clara no topo
        title: const Text(
          'Saiba Mais',
          style: TextStyle(
            color: Color(0xFF15417B), // texto azul
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF15417B)),
      ),

      // corpo da tela
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                // texto principal
                'O MetalCam ajuda a identificar tipos de metal, '
                'mostrar se são recicláveis e indicar locais de coleta.\n\n'
                'Unimos tecnologia e sustentabilidade para '
                'facilitar o descarte consciente.\n\n'
                'Projeto criado por Grupo do Metal.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF6F6E3),
                  fontSize: 18,
                  height: 1.5, // espaçamento entre linhas
                ),
              ),

              const SizedBox(height: 40),

              // botão de voltar ao menu
              ElevatedButton(
                onPressed: () {
                  // fecha a tela atual e volta para o menu
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F6E3),
                  foregroundColor: const Color(0xFF15417B),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Voltar para o menu',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
