import 'package:flutter/material.dart';
// import 'Classes.dart';

void main() {
  runApp(const Load());
}

class Load extends StatelessWidget {
  const Load({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Loading'),
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
  // var screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
    child: Container(  // Container que serve para criar o backoground
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/Loading_Background.png"),
      fit: BoxFit.fill,   
      ),
      ),
      width: 400,
      height: 700,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 20,
      children: [
     Column( // Coluna do texto (serve para delimitar o espaço que o texto pode correr)
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
          ] 
          ),
      ],
    ),

      )
      ),
    );
  }
}
