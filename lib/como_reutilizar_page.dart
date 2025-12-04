import 'package:flutter/material.dart';

class ComoReutilizarPage extends StatelessWidget {
  final String materialName;

  const ComoReutilizarPage({super.key, required this.materialName});

  List<String> getDicas() {
    switch (materialName.toLowerCase()) {
      case 'alumínio':
        return [
          'Use latinhas cortadas para criar vasos pequenos.',
          'Transforme latas em porta-lápis ou luminárias.',
          'Reutilize tampas de alumínio em projetos de arte e decoração.',
        ];
      case 'ferro':
        return [
          'Use peças antigas como suporte de plantas.',
          'Transforme grades ou ferragens em decoração industrial.',
          'Doe ferro velho para oficinas de artesanato.',
        ];
      case 'cobre':
        return [
          'Crie bijuterias com fios de cobre.',
          'Use tubos de cobre como cabides ou suportes de parede.',
          'Recicle fios de cobre para novos cabos elétricos.',
        ];
      case 'aço inox':
        return [
          'Transforme utensílios antigos em porta-canetas ou porta-talheres.',
          'Use como bandeja ou prato improvisado.',
          'Decore vasos ou jardins com peças de aço inox.',
        ];
      default:
        return [
          'Use a criatividade para dar nova vida a esse material!',
          'Pesquise ideias de artesanato com ${materialName.toLowerCase()}.',
          'Doe para projetos de reciclagem e reaproveitamento.',
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final dicas = getDicas();

    return Scaffold(
      backgroundColor: const Color(0xFF15417B),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6E3),
        title: const Text(
          'Como Reutilizar?',
          style: TextStyle(
            color: Color(0xFF15417B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF15417B)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Reutilizando ${materialName.toUpperCase()}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFF6F6E3),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Lista centralizada e estilizada
            ...dicas.map(
              (dica) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '✨ $dica',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFF6F6E3),
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
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
                'Voltar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

