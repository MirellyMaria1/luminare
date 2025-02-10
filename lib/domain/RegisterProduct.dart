
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/bd/PacoteDao.dart';

import 'cardfavs.dart';



class RegisterProduct extends StatefulWidget {
  const RegisterProduct({super.key});




  @override
  State<RegisterProduct> createState() => _RegisterProductState();
}




class _RegisterProductState extends State<RegisterProduct> {


  TextEditingController tituloController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }




  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: tituloController,
            text: 'Título do Produto',
          ),
          buildTextFormField(
            controller: urlImageController,
            text: 'URL da Imagem',
          ),
          buildTextFormField(
            controller: descricaoController,
            text: 'Descrição do Produto',
          ),
          buildTextFormField(
            controller: valorController,
            text: 'Valor do Produto',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDFC8BC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Produto Favorito',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }




  buildTextFormField({
    required TextEditingController controller,
    required String text,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFFDFC8BC),
      ),
    );
  }




  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }




  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFFDFC8BC),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: const Text(
        'Novo Produto Favorito',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }




  buildInputDecoration(String titulo) {
    return InputDecoration(
      label: Text(titulo),
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


    String titulo = tituloController.text;
    String urlImage = urlImageController.text;
    String descricao = descricaoController.text;
    String valor = valorController.text;




    var produto = Cardfavorito(
      titulo: titulo,
      urlImage: urlImage,
      descricao: descricao,
      valor: valor,
    );




    await PacoteDao().salvarPacote(produto);
    Navigator.pop(context);


  }
}
