import 'package:flutter/material.dart';
import '../main.dart'; // Esto es vital para usar el MiDrawer

class MedicamentosPage extends StatelessWidget {
  const MedicamentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEDICAMENTOS"),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      drawer: const MiDrawer(), // Barra lateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("MEDICAMENTOS", 
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Image.network(
              'https://raw.githubusercontent.com/OchoaDavid0663/Act-3-Drawer-Rutas-Nombradas-en-main/refs/heads/main/s1.webp', // URL de GitHub
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}