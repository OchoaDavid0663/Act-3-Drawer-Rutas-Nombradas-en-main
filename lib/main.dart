import 'package:flutter/material.dart';
// Importaciones de tus archivos en la carpeta LasPaginas
import 'LasPaginas/alfa.dart';
import 'LasPaginas/medicamentos.dart';
import 'LasPaginas/productos.dart';
import 'LasPaginas/suplementos.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMILARES',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A1D), // Gris tenue
        primaryColor: const Color(0xFF00E5FF), // Cian Neón
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF1D1E33),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PaginaInicio(),
        '/medicamentos': (context) => const MedicamentosPage(),
        '/productos': (context) => const ProductosPage(),
        '/alfa': (context) => const AlfaPage(),
        '/suplementos': (context) => const SuplementosPage(),
      },
    );
  }
}

// --- DRAWER CON DATOS Y MANEJO DE IMAGEN ---
class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1A1A1D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2D2E42), Color(0xFF1D1E33)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFF00E5FF),
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: const Color(0xFF1D1E33),
                      child: ClipOval(
                        child: Image.network(
                          'https://raw.githubusercontent.com/OchoaDavid0663/Act-3-Drawer-Rutas-Nombradas-en-main/refs/heads/main/simi1.jpg',
                          fit: BoxFit.cover,
                          width: 66,
                          height: 66,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person, color: Color(0xFF00E5FF), size: 30);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF00E5FF)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text('SIMILARES',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  const SizedBox(height: 10),
                  const Text(
                    '📍 Av. Durango #2471\n📞 800-123-456\n✉️ drsimi.durango@gmail.com',
                    style: TextStyle(color: Colors.white60, fontSize: 11, height: 1.5, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _crearItem(context, Icons.grid_view_rounded, 'INICIO', '/'),
            const Divider(color: Colors.white10, indent: 20, endIndent: 20),
            _crearItem(context, Icons.medication_liquid, 'MEDICAMENTOS', '/medicamentos'),
            _crearItem(context, Icons.shopping_bag_outlined, 'PRODUCTOS', '/productos'),
            _crearItem(context, Icons.hub_outlined, 'ALFA CORE', '/alfa'),
            _crearItem(context, Icons.bolt, 'SUPLEMENTOS', '/suplementos'),
          ],
        ),
      ),
    );
  }

  Widget _crearItem(BuildContext context, IconData icono, String nombre, String ruta) {
    return ListTile(
      leading: Icon(icono, color: const Color(0xFF00E5FF)),
      title: Text(nombre, style: const TextStyle(color: Colors.white70, letterSpacing: 1.2, fontSize: 13)),
      onTap: () => Navigator.pushReplacementNamed(context, ruta),
    );
  }
}

// --- PÁGINA DE INICIO ---
class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIMILARES")),
      drawer: const MiDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00E5FF).withOpacity(0.05),
              ),
              child: const Icon(
                Icons.health_and_safety_outlined,
                size: 100,
                color: Color(0xFF00E5FF),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "SIMILARES",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w200,
                letterSpacing: 8,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(width: 50, height: 2, color: const Color(0xFF00E5FF)),
          ],
        ),
      ),
    );
  }
}