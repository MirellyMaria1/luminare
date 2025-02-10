import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/map_page.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC8BC),
        title: Text(
          'politicas de privacidade',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LUMINARE',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(width: 150),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),

          TextButton(
            onPressed: () async {


              List<Location> locations = await locationFromAddress(pacote.cidade);
              Location location =  locations[0];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MapPage(
                      lat: location.latitude,
                      long: location.longitude,
                    );
                  },
                ),
              );
            },
            child: Text(
              'Ver no mapa',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXjKZyt5EEVhzueKy9LCwUYSbq1BtmaLsE4g&s'),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'Coleção Lux',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.tcdn.com.br/img/img_prod/848976/anel_solitario_em_ouro_18k_com_cristal_azul_safira_1829_1_07fe536714dbff6bc25aaafe579b4068.jpeg',
                            )
                        ),
                        /*Image.network(
                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXjKZyt5EEVhzueKy9LCwUYSbq1BtmaLsE4g&s',
                         height: 464),*/
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.lojatayaro.com.br/cdn/shop/articles/4-main-2023-novo-em-ferias-primavera-perolas-prego-hoop-brincos-para-mulher-a-prova-dwaterproof-agua-manchar-livre-pequenos-aros-de-aco-inoxidavel-joias_800x.png?v=1680752008'),
                          )),
                      /*Image.network(
                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXjKZyt5EEVhzueKy9LCwUYSbq1BtmaLsE4g&s',
                         height: 464),*/
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),
                    SizedBox(width: 135),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anel Cravejado Zircônia Azul',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Brinco Pérola Argola ouro',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.bwimg.com.br/maisejoias/produtos/pulseira-de-missangas-coloridas-folheada-a-ouro-18k-1637260750.4232.jpg')),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://down-br.img.susercontent.com/file/c84e22a0ae7163f33fa350942648b024'),
                          )),
                      /*Image.network(
                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXjKZyt5EEVhzueKy9LCwUYSbq1BtmaLsE4g&s',
                         height: 464),*/
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),
                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),
                    SizedBox(width: 153),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),


                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: (15),


                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bracelete cristal multicor',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Kit Colares Trançados',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFDFC8BC),
            width: 1000,
            height: 40,
          )
        ],
      ),
    );
  }
}








