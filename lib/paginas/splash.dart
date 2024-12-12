import 'package:flutter/material.dart';
import 'package:untitled3/paginas/home_page.dart';
import 'package:untitled3/paginas/login.dart';

// Simulando o status do usuário. Normalmente, isso viria de um banco de dados ou de um login.
bool isUserAuthenticated = false;  // Defina isso de acordo com o seu fluxo de autenticação.

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  // Função que simula a verificação do status do usuário
  Future<void> checkUserStatus() async {
    // Aqui você simula a lógica de autenticação. Pode ser substituída por lógica de banco de dados ou API.
    await Future.delayed(const Duration(seconds: 3)); // Simula o tempo de carregamento

    if (isUserAuthenticated) {
      // Se o usuário estiver autenticado, redireciona para a HomePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      // Se o usuário não estiver autenticado, redireciona para a página de Login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF233E7D),
      child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Logo-hurb-branca-bg-azul.jpg/440px-Logo-hurb-branca-bg-azul.jpg'),
    );
  }
}
