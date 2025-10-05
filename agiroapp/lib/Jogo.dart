import 'package:flutter/material.dart';
// import 'Classes.dart';
import 'Home.dart'; 
import 'NPC.dart'; 
import 'Suporte.dart';

void main() {
  runApp(const Jogo());
}

class Jogo extends StatelessWidget {
  const Jogo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo  ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Jogo'),
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
      image: DecorationImage(image: AssetImage("assets/JogoBackground.png"),
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
            SizedBox(
                width: 300,
                child: Column(
                spacing: 10,
                children: [
                Column(
                  children: [  
                Text(
                 style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "JOGO"),],
                ),
                Column(
                  spacing: 2,
                  children: [
                Text(
                 style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Jogabilidade"),
                                 Text(
                 style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Itens"),
                                 Text(
                 style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
                 "Áreas"),
                  ],
                ),
          ],
              )
              ),
          ],
        ),

        Column( 
              children: [
              Container( // CONTAINER DOS BOTÕES
              height: 100,
              width: 400,
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/ButtonsBackground.png"),
              fit: BoxFit.fill,   
      ),
      ),

              child: Row( 
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,

              children:[
               SizedBox(
                height: 50,
                width: 75,
                 child: FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home()));
            },
            child: Row(
            spacing: 4,
            children: [
               Icon(
               Icons.home,
               ),
                Text(
              "Home",
            )  
            
          ],
          ),
          ),
          ),
          SizedBox(
          width: 75,
          height: 50,
          child: FloatingActionButton(           
               onPressed: () {   
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Jogo()));
            },
          child: Row(
              spacing: 4,
              children: [
               Icon(
               Icons.gamepad,
               ),
                Text(
              "Jogo",
            )  
            
          ],
          ),
          ),
                              ),

          SizedBox(
          width: 75,
          height: 50,
          child: FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => NPC()));
            },
          child: Row(
          spacing: 4,
          children: [
               Icon(
               Icons.people,
               ),
                Text(
              "NPC",
            )  
          ],
          ),
          ),
          ),

          SizedBox(
          width: 75,
          height: 50,
          child:
             FloatingActionButton(
               onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Suporte()));
            },
            child: Row(
            children: [
               Icon(
               Icons.email,
               ),
                Text(
              "Suporte",
            )  
          ],
          ),
          ),
         ),
          ],
          ),
          ),
          ] 
          ),
      ],
    ),

      )
      ),
    );
  }
}
