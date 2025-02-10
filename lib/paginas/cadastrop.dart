
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/bd/metodo_dao.dart';
import 'package:untitled3/domain/metodop.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descontoController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();


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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'nova forma de pagamento',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Você precisa digitar um nome!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecoration('nome'),
                  cursorColor: const Color(0xFFDFC8BC),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: false,
                  controller: descontoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Você precisa digitar um desconto!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecoration('Desconto'),
                  cursorColor: const Color(0xFFDFC8BC),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: false,
                  controller: urlImageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Você precisa inserir uma URL!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildInputDecoration('URL da imagem'),
                  cursorColor: const Color(0xFFDFC8BC),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDFC8BC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFFDFC8BC),
        fontWeight: FontWeight.w600,
      ),
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


  Future<void> onPressed() async {
    String nome = nomeController.text;
    String desconto = descontoController.text;
    String urlImage = urlImageController.text;


    Metodo metodo = Metodo(
      urlImage: urlImage,
      nome: nome,
      desconto: desconto,
    );


    await MetodoDao().saveAddress(metodo);
    Navigator.pop(context);
  }
}


