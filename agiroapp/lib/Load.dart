import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(const Load());
}

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto A.G.I.R.O.',
      home: const MyHomePage(title: 'Projeto A.G.I.R.O.'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void iniciar() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }

    Timer(const Duration(seconds: 15), iniciar);

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Loading_Background.png"),
              fit: BoxFit.fill,
            ),
          ),
          width: 400,
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 300),     
              LoadingAnimationWidget.hexagonDots(
                color: const Color.fromARGB(255, 246, 5, 214),
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}