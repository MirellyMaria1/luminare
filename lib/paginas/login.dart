
import 'package:untitled3/bd/pacote_dao.dart';
import 'package:untitled3/paginas/home_page.dart';
import 'package:untitled3/paginas/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC8BC),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
                Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF2D2D2D),
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(height: 32),
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
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String email = usuarioController.text;
                      String senha = senhaController.text;
                      if (email == 'mirelly maria' && senha == '123456') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ),
                        );

                      } else {
                        print('Usuário e/ou Senha incorreto(s)!');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDFC8BC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'ENTRAR',
                      style: GoogleFonts.montserrat(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 6),
                Center(
                  child: Text(
                    'Ainda não tem uma conta?',
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Cadastro();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'CADASTRE-SE',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Color(0xFF342822),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
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
      String usuario = usuarioController.text;
      String senha = senhaController.text;

      bool auth = await UserDao().autenticar(usuario, senha);

      if (auth) {
        // SharedPrefs().setUser(true);

        // Navegar p/ HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      } else {
        print('Usuário e/ou Senha incorreto(s)!');
      }
    }
  }
}


