import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/landing');
    });

    return const Scaffold(
      backgroundColor: Color(0xff44d2ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Catbreeds',
            style: TextStyle(fontFamily: 'The Cat FREE', fontSize: 65),
          ),
          Image(image: AssetImage('assets/images/gato_durmiendo.png'))
        ],
      ),
    );
  }
}
