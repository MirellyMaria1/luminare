import 'package:flutter/material.dart';
import 'package:untitled3/bd/PacoteDao.dart';
import 'package:untitled3/domain/cardfavs.dart';
import 'package:untitled3/paginas/DetailPage.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List favoriteItems = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    favoriteItems = await PacoteDao().listarcards();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Corrigido: Lista agora tem o tipo correto

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFC8BC),
        title: const Text(
          'FAVORITOS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteItems.length, // Corrigido para 'favoriteItems'
          itemBuilder: (context, index) {
            // Corrigido: 'favoriteItems' está sendo usado corretamente
            Cardfavorito item = favoriteItems[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(cardFavorito: item),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Row(
                  children: [
                    Image.network(
                      item.urlImage,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.titulo,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.descricao,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.valor,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
