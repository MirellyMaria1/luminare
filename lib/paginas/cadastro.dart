import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/api/api.dart';
import 'package:untitled3/domain/address.dart';
import 'package:untitled3/paginas/login.dart';
import '../bd/pacote_dao.dart';
import '../domain/register.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _LoginState();
}

class _LoginState extends State<Cadastro> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 120),
              Text(
                'CADASTRO',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  color: const Color(0xFF2D2D2D),
                  fontWeight: FontWeight.w500,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                validator: (value) {
                  if (value!.contains("@")) {
                    return null;
                  } else {
                    return "Você precisa digitar um e-mail válido!";
                  }
                },
                decoration: buildInputDecoration('E-mail'),
                cursorColor: const Color(0xFF10397B),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: usuarioController,
                validator: (value) {
                  if (value!.length >= 8) {
                    return null;
                  } else {
                    return "Você precisa digitar um nome de usuário válido!";
                  }
                },
                decoration: buildInputDecoration('Nome de Usuário'),
                cursorColor: const Color(0xFF000000),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                controller: senhaController,
                validator: (value) {
                  if (value!.length >= 6) {
                    return null;
                  } else {
                    return "Você precisa digitar uma senha válida!";
                  }
                },
                decoration: buildInputDecoration('Senha'),
                cursorColor: const Color(0xFF000000),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  String senha = senhaController.text;
                  if (value!.length >= 6) {
                    return null;
                  } else if (senha != value) {
                    return "As senhas precisam ser iguais!";
                  } else {
                    return "Você precisa digitar uma senha válida!";
                  }
                },
                decoration: buildInputDecoration('Confirmar Senha'),
                cursorColor: const Color(0xFF10397B),
              ),
              const SizedBox(height: 32),
              // Spacer(),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDFC8BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'CADASTRAR',
                    style: GoogleFonts.montserrat(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedIconButton() async {
    String cep = cepController.text;
    try {
      Address address = await AddressApi().findAddressByCep(cep);
      enderecoController.text = address.address;
    } catch (e) {
      showSnackBar('Erro!');
    }
  }

  showSnackBar(String snackBarMessage) {
    SnackBar snackBar = SnackBar(
      content: Text(snackBarMessage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
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

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String username = usuarioController.text;
      String password = senhaController.text;

      Register register = Register(username: username, email: email, password: password);
      await UserDao().saveRegister(register);
      Navigator.pop(context);
    }
  }
}
