
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/bd/metodo_dao.dart';
import 'package:untitled3/domain/metodop.dart';
import 'package:untitled3/paginas/cadastrop.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});


  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  double total = 89;
  List<Metodo> metodo = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }


  loadData() async {
    metodo = await MetodoDao().listarPacotes();
    setState(() {});
  }


  TextEditingController cupomController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDFC8BC),
          title: Text(
            'LUMINARE',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildText('Confirmação do pedido'),
            Divider(),
            buildText('Método do pagamento'),
            buildText('Por favor, selecione um método de pagamento', size: 8),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  leading: Image.network(metodo[i].urlImage),
                  title: Text(metodo[i].nome),
                  trailing: Text(metodo[i].desconto),
                );
              },
              padding: EdgeInsets.all(16),
              separatorBuilder: (_, __) => Divider(),
              itemCount: metodo.length,
            ),


            Container(
              color: Color(0xFFDFC8BC),
              height: 40,
              width: 150,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    ).then(
                          (value) async {
                        await loadData();
                        setState(() {});
                      },
                    );
                  },
                  child: Text(
                    'Cadastrar nova forma de pagamento',
                    style: TextStyle(color: Colors.black),
                  )),
            ),


            SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(),
                  buildText('Cupom'),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: cupomController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Você precisa digitar um cupom!";
                      } else if (text != 'cupom10') {
                        return "Você precisa digitar um cupom válido!";
                      }
                      return null;
                    },
                    decoration: buildInputDecoration('Cupom'),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String cupom = cupomController.text;
                        if (cupom == 'cupom10') {
                          setState(() {
                            total = (total - (total * 0.1));
                          });
                          print('Cupom aplicado!');
                        } else {
                          print('Cupom inválido!');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDFC8BC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Aplicar cupom',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText('Total de pedidos: '),
                      buildText('R\$${total}', color: Colors.orange),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Text(
                    'veja mais...',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                          'https://www.ditorini.com.br/cdn/shop/files/S0e08f1a5a3844985b78fc11f792d27ef7.webp?v=1697249885',
                          height: 150),
                      Image.network(
                          'https://down-br.img.susercontent.com/file/c84e22a0ae7163f33fa350942648b024',
                          height: 150),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  buildText(String text, {double size = 14, Color color = Colors.black}) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }


  buildInputDecoration(String name) {
    return InputDecoration(
      floatingLabelStyle: GoogleFonts.montserrat(
          color: const Color(0xFFDFC8BC), fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFDFC8BC),
        ),
      ),
    );
  }
}

