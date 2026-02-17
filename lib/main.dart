import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const LibreriaAJMG());
}

class LibreriaAJMG extends StatelessWidget {
  const LibreriaAJMG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const PantallaOfertas(),
    );
  }
}

class PantallaOfertas extends StatelessWidget {
  const PantallaOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left, color: Color(0xFFF1C40F), size: 30),
        title: Text(
          'OFERTAS AJMG',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E293B),
        elevation: 10,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          _SeccionHeader(
              titulo: "Ofertas Especiales", colorAcento: const Color(0xFFF1C40F)),
          const Text(
            '– 20% en novelas solo hoy',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 25),
          const _TarjetaLibro(
            titulo: 'DESEO OSCURO',
            precio: '\$250.00',
            categoria: 'Novela Romántica',
            colorBorde: Color(0xFFF1C40F),
            imageUrl: 'https://picsum.photos/seed/deseo/200/300',
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          const _SeccionHeader(
              titulo: "Oferta Educativa", colorAcento: Color(0xFF2ECC71)),
          const Text(
            'Libros de idiomas y gramática',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 25),
          const _TarjetaLibro(
            titulo: 'GRAMÁTICA INGLESA',
            precio: 'Desde \$100.00',
            categoria: 'Educación',
            colorBorde: Color(0xFF2ECC71),
            imageUrl: 'https://picsum.photos/seed/gramatica/200/300',
          ),
          const SizedBox(height: 50),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                '← VOLVER AL INICIO',
                style: TextStyle(color: Colors.white54, letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeccionHeader extends StatelessWidget {
  final String titulo;
  final Color colorAcento;
  const _SeccionHeader({required this.titulo, required this.colorAcento});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 5, height: 25, color: colorAcento),
        const SizedBox(width: 10),
        Text(
          titulo.toUpperCase(),
          style: GoogleFonts.oswald(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _TarjetaLibro extends StatelessWidget {
  final String titulo, precio, categoria, imageUrl;
  final Color colorBorde;

  const _TarjetaLibro(
      {required this.titulo,
      required this.precio,
      required this.categoria,
      required this.colorBorde,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: colorBorde, width: 4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                height: 90,
                width: 60,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 90,
                    width: 60,
                    color: Colors.white.withOpacity(0.05),
                    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 90,
                    width: 60,
                    color: Colors.white.withOpacity(0.05),
                    child: const Icon(Icons.book, color: Colors.white24, size: 30),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoria.toUpperCase(),
                      style: TextStyle(
                          color: colorBorde,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  Text(titulo,
                      style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(precio,
                      style: const TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
