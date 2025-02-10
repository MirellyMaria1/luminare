import 'package:flutter/material.dart';
import 'package:untitled3/paginas/detail_page.dart';


class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _Tela();
}

class _Tela extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC8BC),
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
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'LUMINARE',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Image.network(
            'https://images.tcdn.com.br/img/img_prod/848976/anel_solitario_em_ouro_18k_com_cristal_azul_safira_1829_1_07fe536714dbff6bc25aaafe579b4068.jpeg',
            height: 195,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'banhados a ouro> SEMIJOIAS > ANÉIS > anéis cravejados',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Anel Cravejado Zircônia Azul',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('R\$ 106,00'),
                SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            color: Color(0xFFDFC8BC),
            height: 40,
            width: 150,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ),
                  );
                },
                child: Text(
                  'COMPRE AGORA',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(height: 50),
          Container(
            color: Colors.grey,
            height: 75,
            width: 500,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'subtotal:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'R\$106,00',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
