import 'package:flutter/material.dart';
import 'resultados_page.dart';

class IdentificarMaterialPage extends StatefulWidget {
  const IdentificarMaterialPage({super.key});

  @override
  State<IdentificarMaterialPage> createState() => _IdentificarMaterialPageState();
}

class _IdentificarMaterialPageState extends State<IdentificarMaterialPage> {
  String? _selectedMaterial;
  final List<String> _materiais = [
    'Alumínio',
    'Ferro',
    'Aço Inox',
    'Cobre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15417B),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6E3),
        title: const Text(
          'Identificar Material',
          style: TextStyle(color: Color(0xFF15417B), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF15417B)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Selecione o tipo de metal:',
                style: TextStyle(
                  color: Color(0xFFF6F6E3),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown centralizado e menor
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6E3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedMaterial,
                    isExpanded: true,
                    dropdownColor: const Color(0xFFF6F6E3),
                    hint: const Center(
                      child: Text(
                        'Escolha o material',
                        style: TextStyle(color: Color(0xFF15417B)),
                      ),
                    ),
                    style: const TextStyle(color: Color(0xFF15417B)),
                    iconEnabledColor: const Color(0xFF15417B),
                    items: _materiais
                        .map(
                          (material) => DropdownMenuItem<String>(
                            value: material,
                            alignment: Alignment.center,
                            child: Text(material, textAlign: TextAlign.center),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: _selectedMaterial == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultadosPage(
                              materialName: _selectedMaterial!,
                              isRecyclable: true,
                            ),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6F6E3),
                  foregroundColor: const Color(0xFF15417B),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










