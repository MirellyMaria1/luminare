import 'package:flutter/material.dart';
import 'favoritespage.dart';








class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);








  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;




  void _validatePassword() {
    setState(() {








      _errorMessage = _passwordController.text.length < 8
          ? 'A senha deve ter no mínimo 8 caracteres.'
          : null;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFC8BC),
        title: const Text(
          'acesse os favoritos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [




              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _errorMessage,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _validatePassword();
                  if (_errorMessage == null) {




                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FavoritesPage()),
                    );
                  }
                },
                child: const Text('Ver Favoritos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
