import 'package:flutter/material.dart';
import 'camera_page.dart';
import 'saiba_mais_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF15417B),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      minimumSize: const Size(240, 55),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6E3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.recycling, size: 100, color: Color(0xFF15417B)),
            const SizedBox(height: 20),
            const Text(
              'MetalCam',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF15417B),
              ),
            ),
            const SizedBox(height: 50),

            // Botão Identificar Material
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IdentificarMaterialPage()),
                );
              },
              style: buttonStyle,
              child: const Text('Identificar Material', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),

            // Botão Saiba Mais
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SaibaMaisPage()),
                );
              },
              style: buttonStyle,
              child: const Text('Saiba Mais', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

