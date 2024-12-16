import 'package:flutter/material.dart';
import 'package:untitled3/paginas/home_page.dart';
import 'package:untitled3/paginas/login.dart';

bool isUserAuthenticated = false; 
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

  
  Future<void> checkUserStatus() async {
      await Future.delayed(const Duration(seconds: 5));

    if (isUserAuthenticated) {
           Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
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
      color: const Color(0xFFDFC8BC),
      child: Image.network(
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.behance.net%2Fsearch%2Fprojects%2Flogotipo%2520semijoias&psig=AOvVaw3Kr_Smg_uz07jWXNtPUMdU&ust=1734179473592000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCNi6h5ngpIoDFQAAAAAdAAAAABAE.png'),
    );
  }
}
