import 'package:flutter/material.dart';
import 'package:ana4/domain/cardfavs.dart';
import 'package:google_fonts/google_fonts.dart';




class DetailPage extends StatelessWidget {
  final Cardfavorito cardFavorito;




  const DetailPage({Key? key, required this.cardFavorito}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFC8BC),
        title: Text(
          cardFavorito.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cardFavorito.urlImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),




            Text(
              cardFavorito.titulo,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),




            Text(
              cardFavorito.descricao,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),




            Text(
              cardFavorito.valor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
