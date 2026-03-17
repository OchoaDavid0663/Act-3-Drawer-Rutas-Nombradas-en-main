import 'package:flutter/material.dart';
import '../main.dart'; // Esto es vital para usar el MiDrawer

class SuplementosPage extends StatelessWidget {
  const SuplementosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUPLEMENTOS"),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      drawer: const MiDrawer(), // Barra lateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("SUPLEMENTOS", 
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Image.network(
              'https://raw.githubusercontent.com/OchoaDavid0663/Act-3-Drawer-Rutas-Nombradas-en-main/refs/heads/main/s3.jfif', // URL de GitHub
              width: 200,
              height: 200,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}