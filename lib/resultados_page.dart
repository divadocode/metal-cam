import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'como_reutilizar_page.dart';

class ResultadosPage extends StatelessWidget {
  final String materialName;
  final bool isRecyclable;

  const ResultadosPage({
    super.key,
    required this.materialName,
    this.isRecyclable = true,
  });

  Future<void> _abrirGoogleMaps(BuildContext context) async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=pontos+de+coleta+de+metal+perto+de+mim',
    );

    if (!await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o Google Maps'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15417B),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6E3),
        title: const Text(
          'Resultados',
          style: TextStyle(color: Color(0xFF15417B)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF15417B)),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Ícone principal
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Color(0xFFF6F6E3),
              ),

              const SizedBox(height: 20),

              const Text(
                'Material Identificado',
                style: TextStyle(
                  color: Color(0xFFF6F6E3),
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              // 🔹 Nome do material
              Text(
                materialName.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFFF6F6E3),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // 🔹 Status de reciclagem
              Text(
                isRecyclable ? 'Reciclável' : 'Não Reciclável',
                style: TextStyle(
                  color: isRecyclable
                      ? Colors.greenAccent.shade100
                      : Colors.redAccent.shade100,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // 🔹 Botão "Voltar ao Início"
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F6E3),
                  foregroundColor: const Color(0xFF15417B),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Voltar ao Início'),
              ),

              const SizedBox(height: 14),

              // ✅ Corrigido — abre Google Maps corretamente
              ElevatedButton(
                onPressed: () => _abrirGoogleMaps(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F6E3),
                  foregroundColor: const Color(0xFF15417B),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Pontos Próximos'),
              ),

              const SizedBox(height: 14),

              // 🔹 Botão "Como Reutilizar?"
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ComoReutilizarPage(materialName: materialName),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F6E3),
                  foregroundColor: const Color(0xFF15417B),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Como Reutilizar?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



